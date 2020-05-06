import 'package:flutter/material.dart';
import 'package:zine/theme/constants.dart';
import 'package:zine/theme/theme.dart';

class ZineAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ZineAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Column(
              children: <Widget>[
                Text(
                  "Niveau 1",
                  style: CustomTextStyle.bold18(context),
                ),
                Text(
                  "350 pts",
                  style: CustomTextStyle.green20(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
