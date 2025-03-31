import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:latexpert/core/constant/strings.dart';

class FireStoreCollectionService {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser?.uid;


  fireStoreCollection({required collection,required docId,required Map<String, dynamic> data}){

    _firestore.collection(Strings.fireStoreUser).doc(userId).collection(collection).doc(docId).set(
      data, SetOptions(merge: true)
    );
  }
}