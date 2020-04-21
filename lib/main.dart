import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/services.dart';
import 'pages/pages.dart';

void main() => runApp(ZineApp());

class ZineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(value: AuthService().user),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => LoginPage(),
          '/home': (context) => HomePage(),
        },
        theme: ThemeData(
          fontFamily: 'Product Sans',
          brightness: Brightness.dark,
          textTheme: TextTheme(),
        ),
      ),
    );
  }
}
