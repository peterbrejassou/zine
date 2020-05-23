import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zine/services/_services.dart';
import 'package:zine/pages/_pages.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/theme.dart';

void main() => runApp(ZineApp());

class ZineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (BuildContext context) {
        return ThemeChanger(ThemeData.dark());
      },
      child: ChangeNotifierProvider<BodyChanger>(
        create: (BuildContext context) {
          return BodyChanger(HomePage());
        },
        child: MaterialAppWithTheme(),
      ),
    );
  }
}

class MaterialAppWithTheme extends StatefulWidget {
  @override
  _MaterialAppWithThemeState createState() => _MaterialAppWithThemeState();
}

class _MaterialAppWithThemeState extends State<MaterialAppWithTheme> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  /**
   * Permet de vérifier si l'utilisateur est connecté ou non et rediriger soit vers la page de login, soit vers la page home
   */
  Widget handleAuthentification(context) {
    final body = Provider.of<BodyChanger>(context);

    return StreamBuilder<FirebaseUser>(
      stream: AuthService().streamUser,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return (!snapshot.hasData)
            ? LoginPage()
            : Scaffold(
                key: scaffoldKey,
                appBar: ZineAppBar(),
                body: body.getBody(),
                bottomNavigationBar: ZineBottomNavigationBar(),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zine',
      theme: buildThemeData(theme.getTheme()),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/reset-password': (context) => ResetPasswordPage(),
        '/profile': (context) => ProfilePage(),
        '/changetheme': (context) => ThemeChangerPage(),
      },
      home: handleAuthentification(context),
    );
  }
}
