import 'package:firebase_auth/firebase_auth.dart';
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
      appBar: ZineAppBar(),
      backgroundColor: backgroundTheme,
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Habitudes du moment",
              style: Theme.of(context).textTheme.title,
            ),
            Padding(padding: EdgeInsets.only(top: 45)),
            FutureBuilder(
              future: Globals.defisRef.getDataByUser(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (!snap.hasData) {
                  return ZineLoader();
                }
                List<Defi> defis = snap.data;
                return Container(
                  height: 50,
                  child: ListView.separated(
                    itemCount: defis.length,
                    itemBuilder: (BuildContext context, int index) {
                      //Defi defi = defis[index];
                      return CardDefi();
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
          Navigator.pushNamed(context, '/add-defi');
        },
        label: Text(
          'Ajouter un défi'.toUpperCase(),
          style: CustomTextStyle.bold13(context),
        ),
        backgroundColor: greenZine,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: ZineBottomNavigationBar(),
    );
  }
}
