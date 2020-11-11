import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/models/order.dart';
import 'package:coffee_app/models/user.dart';

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

  List<Order> _snapshotOrders(QuerySnapshot snap) {
    return snap.documents.map((doc) {
      return Order(
          name: doc.data["name"] ?? " ",
          sugar: doc.data["sugar"] ?? " ",
          strength: doc.data["strength"] ?? 100);
    }).toList();
  }

  Stream<List<Order>> get orders {
    return orderCollection.snapshots().map(_snapshotOrders);
  }

  UserData _snapshotUserData(DocumentSnapshot snap) {
    return UserData(
        uid: uid,
        name: snap.data["name"],
        sugar: snap.data["sugar"],
        strength: snap.data["strength"]);
  }

  Stream<UserData> get userData {
    return orderCollection.document(uid).snapshots().map(_snapshotUserData);
  }
}
