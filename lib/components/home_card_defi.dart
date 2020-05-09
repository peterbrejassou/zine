import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/models/_models.dart';
import 'package:zine/services/database/category_service.dart';
import 'package:zine/theme/constants.dart';
import 'package:zine/theme/theme.dart';

class HomeCardDefi extends StatefulWidget {
  final Defi defi;
  const HomeCardDefi({Key key, this.defi}) : super(key: key);

  @override
  _HomeCardDefiState createState() => _HomeCardDefiState();
}

class _HomeCardDefiState extends State<HomeCardDefi> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/defi-details', arguments: {
          'defi': widget.defi,
          'newDefi': false,
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: CategoryService().getOneData(widget.defi.category),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return ZineLoader();
            }
            Category category = snapshot.data;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 167,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        category.title.toUpperCase(),
                        style: CustomTextStyle.regular12green(context),
                      ),
                      Text(
                        widget.defi.title,
                        style: CustomTextStyle.regular18(context),
                      ),
                    ],
                  ),
                ),
                IconCircleBackground(
                  image: category.icon,
                  color: greenZine,
                  width: 65,
                  padding: 16,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
