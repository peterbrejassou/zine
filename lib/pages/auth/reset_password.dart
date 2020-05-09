import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/theme/constants.dart';

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
      backgroundColor: backgroundTheme,
      body: Container(
        margin: EdgeInsets.only(top: 25),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/logo_zine.png',
                width: 180,
              ),
              Text(
                'Mot de passe oublié',
                style: Theme.of(context).textTheme.headline1,
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              Text(
                'Saisissez votre adresse mail ci-dessous,\nvous recevrez les instructions pour réinitialiser votre mot de passe.',
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              CustomTextField(controller: _email, field: "Adresse email"),
              Padding(padding: EdgeInsets.only(top: 50)),
              CustomButton(
                callback: null,
                text: "Envoyer",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
