import 'package:flutter/material.dart';
import 'package:zine/components/FriendItem.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Amis', style: Theme.of(context).textTheme.headline1),
            Padding(padding: EdgeInsets.only(top: 20)),
            FriendItem(
              img: 'chuck-norris.png',
              name: 'Chuck Norris',
              points: '19500',
            ),
            FriendItem(
              img: 'brian-alexander.png',
              name: 'Brian Alexander',
              points: '17000',
            ),
            FriendItem(
              img: 'marilyn-porter.png',
              name: 'Marilyn Porter',
              points: '16800',
            ),
            FriendItem(
              img: 'beverly-griffin.png',
              name: 'Beverly Griffin',
              points: '19500',
            ),
            FriendItem(
              img: 'betty-greene.png',
              name: 'Betty Greene',
              points: '19500',
            ),
            FriendItem(
              img: 'dylan-elliott.png',
              name: 'Dylan Elliott',
              points: '19500',
            ),
            FriendItem(
              img: 'kevin-brown.png',
              name: 'Kevin Brown',
              points: '19500',
            ),
            Padding(padding: EdgeInsets.only(bottom: 30)),
          ],
        ),
      ),
    );
  }
}
