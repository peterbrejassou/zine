import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/constants.dart';
import 'package:zine/theme.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController _email;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                          color: grayLightZine,
                        ),
                      ),
                      top: 30,
                      left: 0,
                    ),
                    Image.asset(
                      'assets/logo_zine.png',
                      width: 180,
                    ),
                  ],
                ),
              ),
              Text(
                'Mot de passe oublié',
                style: Theme.of(context).textTheme.headline1,
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              Text(
                'Saisissez votre adresse mail ci-dessous, vous recevrez les instructions pour réinitialiser votre mot de passe.',
                style: ZineTextStyle.regular15(context),
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              ZineTextField(controller: _email, field: "Adresse email"),
              Padding(padding: EdgeInsets.only(top: 50)),
              ZineButton(
                callback: () {},
                label: "Envoyer",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
