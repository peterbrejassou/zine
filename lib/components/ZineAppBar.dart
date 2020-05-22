import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/components/ZineLoader.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/User.dart';
import 'package:zine/pages/AssociationsPage.dart';
import 'package:zine/services/BodyChanger.dart';
import 'package:zine/services/database/UserService.dart';
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
        child: FutureBuilder(
          future: UserService().getUserDetails(false),
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            User user = snapshot.data;
            if (snapshot.hasData) {
              return Row(
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
                      backgroundImage: NetworkImage(user.photo),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/profile',
                            arguments: user,
                          );
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
                          "Niveau " + user.level.toString(),
                          style: ZineTextStyle.bold18(context),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              user.points.toString(),
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
              );
            } else {
              return ZineLoader();
            }
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
