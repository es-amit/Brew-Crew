import 'package:brew_crew/modals/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // user modal based on firebase
  MyUser? _userfromFirebase(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<MyUser> get user{
    return _auth.authStateChanges()
    .map((User? user) => _userfromFirebase(user!)!);
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
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;

    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user =result.user;

      // create a new document for the user with uid
      await DatabaseService(uid: user!.uid).updateUserData('0', 'new crew member', 100);
      return _userfromFirebase(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // logout
  Future signOut() async{
    try{
      return await _auth.signOut();     //builtin method in firebase 
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}