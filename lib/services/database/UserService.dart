import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zine/models/User.dart';
import 'package:zine/services/AuthService.dart';

class UserService {
  CollectionReference collectionReference =
      Firestore.instance.collection('users');

  Future<User> getUserDetails(userId) async {
    var userUid;
    if (!userId) {
      FirebaseUser user = await AuthService().getUser;
      userUid = user.uid;
    } else {
      userUid = userId;
    }
    var detailsUser = await collectionReference.document(userUid).get();
    return User.fromMap(detailsUser.data);
  }

  getFriends() async {
    FirebaseUser user = await AuthService().getUser;
    User userDetails = await UserService().getUserDetails(user.uid);
    return userDetails.friends
        .map((userId) => UserService().getUserDetails(userId.data))
        .toList();
  }

  /* void addDefi(Defi defi) async {
    FirebaseUser user = await AuthService().getUser;
    await collectionReference
        .document(user.uid)
        .collection('defis')
        .add(defi.toMap());
  } */
}
