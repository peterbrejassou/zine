import 'package:flutter/material.dart';
import 'package:zine/components/friend_item.dart';

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Amis', style: Theme.of(context).textTheme.headline1),
          Padding(padding: EdgeInsets.only(top: 20)),
          FriendItem(
            img: 'john_doe.png',
            name: 'Chuck Norris',
            points: '19500',
          ),
          FriendItem(
            img: 'john_doe.png',
            name: 'Brian Alexander',
            points: '19500',
          ),
          FriendItem(
            img: 'john_doe.png',
            name: 'Chuck Norris',
            points: '19500',
          ),
          FriendItem(
            img: 'john_doe.png',
            name: 'Chuck Norris',
            points: '19500',
          ),
        ],
      ),
    );
  }
}
