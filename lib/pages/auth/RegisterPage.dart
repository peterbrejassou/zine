import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/constants.dart';
import 'package:zine/services/_services.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthService _auth = AuthService();

  TextEditingController _username;
  TextEditingController _email;
  TextEditingController _password;
  TextEditingController _passwordConfirm;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _passwordConfirm = TextEditingController();
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _passwordConfirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                "Bienvenue !",
                style: Theme.of(context).textTheme.headline1,
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              ZineTextField(
                field: "Nom d'utilisateur",
                controller: _username,
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              ZineTextField(
                field: "Adresse email",
                controller: _email,
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              ZineTextField(
                field: "Mot de passe",
                controller: _password,
                obscure: true,
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              ZineTextField(
                field: "Confirmation du mot de passe",
                controller: _passwordConfirm,
                obscure: true,
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              ZineButton(
                callback: () async {
                  var newUser = await _auth.register(
                    _email.text,
                    _password.text,
                    _username.text,
                  );
                  if (newUser != null) {
                    Navigator.pushReplacementNamed(context, '/');
                  }
                },
                label: "Inscription",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
