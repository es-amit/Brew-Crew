import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}