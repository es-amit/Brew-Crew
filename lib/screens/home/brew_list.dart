import 'package:brew_crew/modals/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {

  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<Brew?>?>(context);
    if(brews != null){
      brews.forEach((brew){
      print(brew!.name);
      print(brew!.sugars);
      print(brew!.strength);
    });
    }

    return Container(

    );
  }
}