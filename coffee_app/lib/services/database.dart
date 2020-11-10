import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  final CollectionReference orderCollection =
      Firestore.instance.collection("orders");

  Future updateData(String name, String sugar, int strength) async {
    return await orderCollection
        .document(uid)
        .setData({"name:": name, "sugar": sugar, "strength": strength});
  }

  Stream<QuerySnapshot> get orders {
    return orderCollection.snapshots();
  }
}
