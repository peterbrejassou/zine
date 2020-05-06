import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zine/services/_services.dart';

class Collection<T> {
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  Collection({this.path}) {
    ref = _db.collection(path);
  }

  Future<T> getOneData(String id) async {
    var snapshots = await ref.document(id).get();
    var test = Globals.models[T](snapshots.data) as T;
    print(test);
    return test;
  }

  Future<List<T>> getData() async {
    var snapshots = await ref.getDocuments();
    return snapshots.documents
        .map((doc) => Globals.models[T](doc.data) as T)
        .toList();
  }

  Future<List<T>> getDataByUser() async {
    var user = await AuthService().getUser;
    var snapshots = await _db
        .collection("users")
        .document(user.uid)
        .collection('defis')
        .getDocuments();

    print(snapshots.documents);

    /* snapshots.documents.forEach((doc) {
      var test = getOneData(doc.documentID);
      print("bonjour");
      print(test);
    }); */
  }

  Stream<List<T>> streamData() {
    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Globals.models[T](doc.data) as T));
  }
}
