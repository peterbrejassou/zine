import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zine/pages/news.dart';
import 'package:zine/theme/theme.dart';
import 'services/_services.dart';
import 'pages/_pages.dart';

void main() => runApp(ZineApp());

class ZineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(value: AuthService().streamUser),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/reset-password': (context) => ResetPasswordPage(),
          '/home': (context) => HomePage(),
          '/add-defi-step1': (context) => AddDefiStep1(),
          '/add-defi-step2': (context) => AddDefiStep2(),
          '/defi-details': (context) => DefiDetails(),
          '/news': (context) => NewsPage(),
          '/article': (context) => ArticlePage(),
          '/game': (context) => GamePage(),
          '/friends': (context) => FriendsPage(),
          '/profile': (context) => ProfilePage(),
        },
        theme: buildThemeData(),
      ),
    );
  }
}
