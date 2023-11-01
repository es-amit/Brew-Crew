import 'package:brew_crew/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDg6G4ZKA3Rpsx6-4XXwD588x3VBRJG2RE", 
      appId: "1:1043015148260:android:cf46654232f84dc39dc2f", 
      messagingSenderId: "1043015148260", 
      projectId: "brew-crew-b1029")
  );
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
    );
  }
}