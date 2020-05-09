import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zine/models/_models.dart';
import 'package:zine/services/auth.dart';

class UserService {
  CollectionReference collectionReference =
      Firestore.instance.collection('users');

  Future<List<dynamic>> getDefis() async {
    FirebaseUser user = await AuthService().getUser;
    var userObject = await collectionReference.document(user.uid).get();
    return userObject.data['defis'].map((defi) => Defi.fromMap(defi)).toList();
  }
}
