import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/models/_models.dart';
import 'package:zine/pages/add_defi/AddDefiStep1.dart';
import 'package:zine/services/_services.dart';
import 'package:zine/theme.dart';

class AddDefiStep2 extends StatelessWidget {
  final Category category;

  AddDefiStep2({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BodyChanger _bodyChanger = Provider.of<BodyChanger>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _bodyChanger.setBody(AddDefiStep1());
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
          Row(
            children: <Widget>[
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: HexColor(category.color),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    )),
                child: IconCircleBackground(
                  image: category.icon,
                  color: HexColor(category.color),
                  width: 65,
                  padding: 5,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                category.title,
                style: ZineTextStyle.regular15(context),
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          FutureBuilder(
            future:
                DefiService().getDefisOfCategoryExceptUserDefis(category.id),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return ZineLoader();
              } else {
                if (snapshot.data.length == 0) {
                  return Column(
                    children: <Widget>[
                      Text(
                        "Aucun défi pour cette catégorie",
                        textAlign: TextAlign.center,
                        style: ZineTextStyle.regular15gray(context),
                      ),
                    ],
                  );
                } else {
                  List<Defi> defis = snapshot.data;
                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: defis.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardDefi(defi: defis[index], category: category);
                    },
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
