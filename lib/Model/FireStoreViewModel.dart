import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreViewModel {
  final CollectionReference recipesCollection =
  FirebaseFirestore.instance.collection('Recipes');

  Stream<QuerySnapshot> getNotes() {
    return recipesCollection.snapshots();
  }

  void addNote(String name, Array ingredients, Array insructions) {
    recipesCollection.add({'name': name, 'ingredients': ingredients,'insructions':insructions});
  }
}




