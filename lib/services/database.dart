import 'package:brew_crew/modals/brew.dart';
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


  // convert to list of brews from snapshots
  List<Brew> _brewListFromSnapShot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Brew(
          name: doc.get('name') ?? '',
          sugars: doc.get('sugars') ?? '0',
          strength: doc.get('strength') ?? 0
      );
    }).toList();
  }
    
  // get brews stream

  Stream <List<Brew>> get brews{
    return brewCollection.snapshots()
    .map(_brewListFromSnapShot);
  }

}