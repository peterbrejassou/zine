import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/_models.dart';
import 'package:zine/pages/DefiDetail.dart';
import 'package:zine/services/BodyChanger.dart';
import 'package:zine/services/ThemeChanger.dart';
import 'package:zine/services/database/CategoryService.dart';
import 'package:zine/theme.dart';

class HomeCardDefi extends StatefulWidget {
  final Defi defi;
  const HomeCardDefi({Key key, this.defi}) : super(key: key);

  @override
  _HomeCardDefiState createState() => _HomeCardDefiState();
}

class _HomeCardDefiState extends State<HomeCardDefi> {
  @override
  Widget build(BuildContext context) {
    BodyChanger _bodyChanger = Provider.of<BodyChanger>(context);
    final theme = Provider.of<ThemeChanger>(context);
    final brightness = theme.getThemeBrightness();

    return GestureDetector(
      onTap: () {
        _bodyChanger.setBody(DefiDetails(
          defi: widget.defi,
          newDefi: false,
          previousPage: 'home',
        ));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
        decoration: BoxDecoration(
          border: Border.all(
              color: brightness == Brightness.dark ? Colors.white : grayZine),
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
                        style: ZineTextStyle.regular12green(context),
                      ),
                      Text(
                        widget.defi.title,
                        style: ZineTextStyle.regular18(context),
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
