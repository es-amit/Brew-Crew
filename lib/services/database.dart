import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({required this.uid});

  // collection refernece
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('Brews');

  Future updateUserData(String sugars,String name,int strength) async{
    return await brewCollection.doc(uid).set({
      'sugars':sugars,
      'name': name,
      'strength': strength,
    });
  }
}