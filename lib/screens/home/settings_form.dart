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
  int _currentStrength=100;

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
            decoration: textInputDecoration,
            value: _currentSugars == '' ? sugars[0] : sugars[0],
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text("$sugar sugars"),
              );
            }).toList(),

            onChanged: (val) => setState(() => _currentSugars = val as String),
          ),



          //slider for strength
          Slider(
            activeColor: Colors.brown[_currentStrength == 100 ? 100 : _currentStrength],
            inactiveColor: Colors.brown[_currentStrength == 100 ? 100 : _currentStrength],
            value: _currentStrength == 100 ? 100 : _currentStrength.toDouble(),
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (val) => setState(()=> _currentStrength = val as int),
          ),



          SizedBox(height: 20.0,),



          //button to update
          ElevatedButton(
            
            onPressed: () async{
              print(_currentName);
              print(_currentSugars);
              print(_currentStrength);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
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