import 'package:flutter/material.dart';
import 'package:zine/components/ZineTextField.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/services/AuthService.dart';
import 'package:zine/theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email;
  TextEditingController _password;

  @override
  void initState() {
    super.initState();

    _email = TextEditingController();
    _password = TextEditingController();

    AuthService().getUser.then(
      (user) {
        if (user != null) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      },
    );
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
      body: Container(
        margin: EdgeInsets.only(top: 25),
        padding: EdgeInsets.fromLTRB(30, 50, 30, 40),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/logo_zine.png",
                width: 250,
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              ZineTextField(
                field: "Nom d'utilisateur",
                controller: _email,
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              ZineTextField(
                field: "Mot de passe",
                controller: _password,
                obscure: true,
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/reset-password');
                    },
                    child: Text(
                      "Mot de passe oublié ?",
                      style: ZineTextStyle.regular13grayunderline(context),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              ZineButton(
                callback: () async {
                  await AuthService().signIn(_email.text, _password.text);
                },
                label: "Connexion",
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              FlatButton(
                child: Text("Continuer en tant qu'invité"),
                onPressed: () async {
                  await AuthService().signIn("john.doe@mail.fr", "johndoe");
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          height: 40,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Pas encore de compte ? '),
                  TextSpan(
                      text: 'Inscrivez-vous ! ',
                      style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        elevation: 0,
      ),
    );
  }
}
