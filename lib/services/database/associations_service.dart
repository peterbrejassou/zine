import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zine/models/association.dart';

class AssociationService {
  CollectionReference collectionReference =
      Firestore.instance.collection('associations');

  Future<List<Association>> getData() async {
    var snapshots = await collectionReference.getDocuments();
    return snapshots.documents
        .map((doc) => Association.fromMap(doc.data))
        .toList();
  }

  Stream<List<Association>> streamData() {
    return collectionReference.snapshots().map((list) =>
        list.documents.map((doc) => Association.fromMap(doc.data)).toList());
  }
}
