import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({super.key, required this.toggleView});


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  //text field state

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text("Sign in Brew Crew"),
        actions: <Widget>[
          TextButton.icon(
            onPressed: (){
              widget.toggleView();
          }, 
          icon: const Icon(Icons.app_registration_rounded,
          color: Colors.black), 
          label: const Text("Register",
          style:TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          )))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 15.0),
        child: Form(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20.0,),
              TextFormField(
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },

              ),
              const SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                },
              ),
              const SizedBox(height: 20.0,),
              ElevatedButton(
                
                onPressed: () async{
                  print(email);
                  print(password);
                }, 
                child:
                const Text("Sign in",
                style: TextStyle(
                  color: Colors.white
                ),)
                )
            ],
          ),)
      ),
    );
  }
}