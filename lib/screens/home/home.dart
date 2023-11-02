import 'package:brew_crew/modals/brew.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>?>.value(
      initialData: null,
      value: DatabaseService(uid: '').brews, 
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text("Brew Crew"),
          elevation: 0.0,
          backgroundColor: Colors.brown[400],
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async{
                await _auth.signOut();
              }
            , icon: Icon(Icons.person), 
            label: const Text("Logout",
            style: TextStyle(
              color: Colors.black,
              fontSize:17,
              fontWeight: FontWeight.bold,
            ),)),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}