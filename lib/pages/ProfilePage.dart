import 'package:flutter/material.dart';
import 'package:zine/components/OptionRow.dart';
import 'package:zine/constants.dart';
import 'package:zine/models/User.dart';
import 'package:zine/services/AuthService.dart';
import 'package:zine/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 25),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 30),
              height: 80,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(
                  'assets/icons/cross.png',
                  width: 20,
                  alignment: Alignment.centerRight,
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.photo),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(user.firstname + ' ' + user.lastname,
                        style: ZineTextStyle.regular25(context)),
                    Text('@' + user.username),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("Niveau " + user.level.toString(),
                        style: ZineTextStyle.bold18(context)),
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
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            Text("Profil", style: ZineTextStyle.bold20(context)),
            Padding(padding: EdgeInsets.only(top: 15)),
            OptionRow(
              icon: 'user.png',
              text: 'Informations',
              callback: null,
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            Text("Préférences", style: ZineTextStyle.bold20(context)),
            Padding(padding: EdgeInsets.only(top: 15)),
            OptionRow(
              icon: 'design.png',
              text: 'Thème',
              callback: () {
                Navigator.pushNamed(context, '/changetheme');
              },
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            OptionRow(
              icon: 'notification.png',
              text: 'Notifications',
              callback: null,
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            Text("Compte", style: ZineTextStyle.bold20(context)),
            Padding(padding: EdgeInsets.only(top: 15)),
            OptionRow(
              icon: 'logout.png',
              text: 'Déconnexion',
              callback: () async {
                await _auth.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
