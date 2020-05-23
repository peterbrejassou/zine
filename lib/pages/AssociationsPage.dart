import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/Association.dart';
import 'package:zine/pages/AssociationDetailPage.dart';
import 'package:zine/services/BodyChanger.dart';
import 'package:zine/services/ThemeChanger.dart';
import 'package:zine/services/database/AssociationService.dart';

class AssociationsPage extends StatelessWidget {
  const AssociationsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BodyChanger _bodyChanger = Provider.of<BodyChanger>(context);
    final theme = Provider.of<ThemeChanger>(context);
    final brightness = theme.getThemeBrightness();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Associations",
            style: Theme.of(context).textTheme.headline1,
          ),
          Padding(padding: EdgeInsets.only(top: 25)),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 262,
              child: StreamBuilder(
                stream: AssociationService().streamData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return ZineLoader();
                  }
                  List<Association> associations = snapshot.data;
                  print(associations);
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: associations.length,
                    itemBuilder: (BuildContext context, int index) {
                      Association association = associations[index];
                      return GestureDetector(
                        onTap: () {
                          _bodyChanger.setBody(
                              AssociationDetailsPage(association: association));
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Image.network(association.img),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: (brightness == Brightness.dark)
                                  ? Colors.white
                                  : grayZine,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
