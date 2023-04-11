import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDbHelper {
  FireStoreDbHelper._();

  static final FireStoreDbHelper fireStoreDbHelper = FireStoreDbHelper._();

  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> update(
      Map<String, dynamic> data,{required String id}) async {
    await db.collection('vote').doc(id).update(data);
  }
}