import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zine/models/_models.dart';
import 'package:zine/services/auth.dart';

class UserService {
  CollectionReference collectionReference =
      Firestore.instance.collection('users');

  Future<List<dynamic>> getDefis() async {
    FirebaseUser user = await AuthService().getUser;
    var defisUser = await collectionReference
        .document(user.uid)
        .collection('defis')
        .getDocuments();
    return defisUser.documents.map((defi) => print(defi.data));
  }

  Future<User> getUserDetails() async {
    FirebaseUser user = await AuthService().getUser;
    var detailsUser = await collectionReference.document(user.uid).get();
    return User.fromMap(detailsUser.data);
  }

  void addDefi(Defi defi) async {
    FirebaseUser user = await AuthService().getUser;
    await collectionReference
        .document(user.uid)
        .collection('defis')
        .add(defi.toMap());
  }
}
