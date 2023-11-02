import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {


  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4'];

  // form values
  String _currentName="";
  String _currentSugars="";
  late int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children:  <Widget>[
          const Text('Update your Brew Settings',
          style: TextStyle(
            fontSize: 18.0),
          ),
          const SizedBox(height: 20.0,),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: "Name"),
            validator: (val) => val!.isEmpty ? "Please Enter a name" : null,
            onChanged: (val) => setState(()=> _currentName = val),
          ),
          const SizedBox(height: 20.0,),
          // DropDown 
          DropdownButtonFormField<String>(
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text("$sugar sugars"),
              );
            }).toList(),

            onChanged: (val) => setState(() => _currentSugars = val as String),
          ),
          //slider for strength


          //button to update
          ElevatedButton(
            
            onPressed: () async{
              print(_currentName);
              print(_currentSugars);
              print(_currentStrength);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            
            child: const Text(
              'Update',
              style: TextStyle(
                color: Colors.white,
              ),
            ))
               
        ],
      ));
  }
}