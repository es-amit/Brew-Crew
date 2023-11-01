import 'package:brew_crew/modals/user.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);
    print(user);
    //return either home or authenticate
    return Authenticate();
  }
}