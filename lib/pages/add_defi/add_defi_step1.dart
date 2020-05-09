import 'package:flutter/material.dart';
import 'package:zine/components/appbar.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/components/category_defi.dart';
import 'package:zine/components/navigation_bar.dart';
import 'package:zine/models/category.dart';
import 'package:zine/services/database/category_service.dart';
import 'package:zine/theme/constants.dart';

class AddDefiStep1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundTheme,
      body: Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: <Widget>[
            ZineAppBar(),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Quel défi souhaitez-vous démarrer ?",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    FutureBuilder(
                      future: CategoryService().getData(),
                      builder: (BuildContext context, AsyncSnapshot snap) {
                        if (!snap.hasData) {
                          return ZineLoader();
                        }
                        List<Category> categories = snap.data;
                        return Container(
                          height: MediaQuery.of(context).size.height - 334,
                          child: ListView.separated(
                            itemCount: categories.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CategoryDefi(category: categories[index]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) => Padding(
                              padding: EdgeInsets.only(top: 20),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ZineBottomNavigationBar(),
    );
  }
}