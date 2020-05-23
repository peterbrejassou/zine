import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/models/Category.dart';
import 'package:zine/pages/HomePage.dart';
import 'package:zine/services/BodyChanger.dart';
import 'package:zine/services/database/CategoryService.dart';

class AddDefiStep1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BodyChanger _bodyChanger = Provider.of<BodyChanger>(context);

    return ZineContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _bodyChanger.setBody(HomePage());
                },
                child: Container(
                  child: Icon(Icons.arrow_back_ios),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 104,
                child: Text(
                  "Quel défi souhaitez-vous démarrer ?",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          FutureBuilder(
            future: CategoryService().getData(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (!snap.hasData) {
                return ZineLoader();
              }
              List<Category> categories = snap.data;
              return Container(
                height: MediaQuery.of(context).size.height - 334,
                child: ListView.separated(
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryDefi(category: categories[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
