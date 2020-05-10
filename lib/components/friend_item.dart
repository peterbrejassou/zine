import 'package:flutter/material.dart';
import 'package:zine/theme/theme.dart';

class FriendItem extends StatelessWidget {
  final String img;
  final String name;
  final String points;

  const FriendItem({
    Key key,
    this.img,
    this.name,
    this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/friends/" + img,
            width: 60,
          ),
          Padding(padding: EdgeInsets.only(left: 20)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: CustomTextStyle.regular16(context),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                points + ' pts',
                style: CustomTextStyle.regular15green(context),
              ),
            ],
          )
        ],
      ),
    );
  }
}
