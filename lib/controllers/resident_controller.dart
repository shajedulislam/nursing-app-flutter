import 'package:cloud_firestore/cloud_firestore.dart';

class ResidentController {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  String collection = "residents";

  getResidents() {
    return fireStore.collection(collection).snapshots();
  }
}
