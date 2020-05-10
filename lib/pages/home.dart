import 'package:flutter/material.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/models/_models.dart';
import 'package:zine/services/_services.dart';
import 'package:zine/theme/constants.dart';
import 'package:zine/theme/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundTheme,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Habitudes du moment",
              style: Theme.of(context).textTheme.headline1,
            ),
            Padding(padding: EdgeInsets.only(top: 45)),
            FutureBuilder(
              future: UserService().getDefis(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("Aucun défi en cours..."),
                  );
                }
                List<dynamic> defis = snapshot.data;
                return Container(
                  height: MediaQuery.of(context).size.height - 282,
                  child: ListView.separated(
                    itemCount: defis.length,
                    itemBuilder: (BuildContext context, int index) {
                      Defi defi = defis[index];
                      print("in home page");
                      print(defi);
                      return HomeCardDefi(defi: defi);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //Navigator.pushNamed(context, '/add-defi-step1');
          AuthService().signOut();
        },
        label: Text(
          'Ajouter un défi'.toUpperCase(),
          style: CustomTextStyle.bold13(context),
        ),
        backgroundColor: greenZine,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
