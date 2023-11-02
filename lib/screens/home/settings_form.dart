import 'package:brew_crew/modals/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final user = Provider.of<MyUser?>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user!.uid).userData,
      builder: (context, snapshot) {

        if(snapshot.hasData){

          UserData? userData = snapshot.data;
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
                initialValue: userData!.name,
                decoration: textInputDecoration.copyWith(hintText: "Name"),
                validator: (val) => val!.isEmpty ? "Please Enter a name" : null,
                onChanged: (val) => setState(()=> _currentName = val),
              ),

              const SizedBox(height: 20.0,),
    
    
    
              // DropDown 
              DropdownButtonFormField<String>(
                decoration: textInputDecoration,
                value: _currentSugars == '' ? sugars[0] : userData!.sugars,
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
                activeColor: Colors.brown[_currentStrength == userData.strength ? userData.strength : _currentStrength],
                inactiveColor: Colors.brown[_currentStrength == userData.strength ? userData.strength : _currentStrength],
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
                  if(_formkey.currentState!.validate()){
                    await DatabaseService(uid: user.uid).updateUserData(
                       _currentSugars ?? userData!.sugars!,
                        _currentName ?? userData!.name!,
                        _currentStrength ?? userData!.strength!
                      );
                      Navigator.pop(context);

                  }
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
        else{
          return Loading();
        }
        
      }
    );
  }
}