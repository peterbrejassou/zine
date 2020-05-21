import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/constants.dart';
import 'package:zine/pages/AssociationsPage.dart';
import 'package:zine/services/BodyChanger.dart';
import 'package:zine/theme.dart';

class ZineAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ZineAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BodyChanger _bodyChanger = Provider.of<BodyChanger>(context);
    return PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: Container(
        margin: EdgeInsets.only(top: 25),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.white),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: greenZine),
              ),
              padding: EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/john_doe.png'),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _bodyChanger.setBody(AssociationsPage());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Niveau 1",
                    style: ZineTextStyle.bold18(context),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "350",
                        style: ZineTextStyle.bold20green(context),
                      ),
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Image.asset(
                        "assets/icons/drop.png",
                        height: 15,
                        color: greenZine,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
