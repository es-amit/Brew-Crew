import 'package:brew_crew/modals/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // user modal based on firebase
  MyUser? _userfromFirebase(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // sign in anon

  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userfromFirebase(user!);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  // sign in with email and password

  // register with email and password

  // logout
}