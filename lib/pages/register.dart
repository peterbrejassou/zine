import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _email;
  TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 25),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/logo_zine.png",
                width: 180,
              ),
              Text(
                "Bienvenue !",
                style: Theme.of(context).textTheme.headline,
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              CustomTextField(field: "Nom d'utilisateur"),
              Padding(padding: EdgeInsets.only(top: 15)),
              CustomTextField(field: "Adresse email"),
              Padding(padding: EdgeInsets.only(top: 15)),
              CustomTextField(
                field: "Mot de passe",
                obscure: true,
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              CustomTextField(
                field: "Confirmation du mot de passe",
                obscure: true,
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              CustomButton(
                callback: null,
                text: "Inscription",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
