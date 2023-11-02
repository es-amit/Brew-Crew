import 'package:brew_crew/modals/brew.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  
  final AuthService _auth = AuthService();

  

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Brew>?>.value(
      initialData: null,
      value: DatabaseService(uid: '').brews, 
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: const Text("Brew Crew"),
          elevation: 0.0,
          backgroundColor: Colors.brown[400],
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async{
                await _auth.signOut();
              }
            , icon: const Icon(Icons.person,
                color: Colors.black,), 
            label: const Text("Logout",
            style: TextStyle(
              color: Colors.black,
              fontSize:17,
              fontWeight: FontWeight.bold,
            ),)),

            TextButton.icon(
              onPressed: () => _showSettingsPanel(), 
              icon: const Icon(Icons.settings,
              color: Colors.black,),
              label: const Text('Settings',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),),)
          ],
        ),
        body: const BrewList(),
      ),
    );
  }
}