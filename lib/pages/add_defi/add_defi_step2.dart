import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zine/components/_components.dart';
import 'package:zine/models/_models.dart';
import 'package:zine/services/_services.dart';
import 'package:zine/theme/constants.dart';

class AddDefiStep2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Category category = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: ZineAppBar(),
      backgroundColor: backgroundTheme,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: StreamBuilder(
          stream: DefiService().streamDefisOfCategory(category.id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return ZineLoader();
            }
            List<Defi> defis = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: defis.length,
              itemBuilder: (BuildContext context, int index) {
                return CardDefi(defi: defis[index]);
              },
            );
          },
        ),
      ),
      bottomNavigationBar: ZineBottomNavigationBar(),
    );
  }
}
