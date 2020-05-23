import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/_models.dart';
import 'package:zine/pages/add_defi/AddDefiStep1.dart';
import 'package:zine/services/BodyChanger.dart';
import 'package:zine/services/database/DefiService.dart';
import 'package:zine/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BodyChanger _bodyChanger = Provider.of<BodyChanger>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Habitudes du moment",
              style: Theme.of(context).textTheme.headline1,
            ),
            Padding(padding: EdgeInsets.only(top: 45)),
            FutureBuilder(
              future: DefiService().getDefisOfUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot);
                if (snapshot.hasData) {
                  List<Defi> defis = snapshot.data;
                  return Container(
                    height: MediaQuery.of(context).size.height - 282,
                    child: ListView.separated(
                      itemCount: defis.length,
                      itemBuilder: (BuildContext context, int index) {
                        Defi defi = defis[index];
                        return HomeCardDefi(defi: defi);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    //child: Text("Aucun défi en cours..."),
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: ZineLoader(),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _bodyChanger.setBody(AddDefiStep1());
        },
        label: Text(
          'Ajouter un défi'.toUpperCase(),
          style: ZineTextStyle.bold13(context),
        ),
        backgroundColor: greenZine,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
