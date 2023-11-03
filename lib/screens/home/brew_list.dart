import 'package:brew_crew/modals/brew.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';
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

    final brews = Provider.of<List<Brew>?>(context) ?? [];
    // ignore: unnecessary_null_comparison
    if(brews != null){
      for (var brew in brews) {
      print(brew.name);
      print(brew.sugars);
      print(brew.strength);
    }
    }

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context,int index){
        return BrewTile(brew: brews[index]);
      },
      

    );
  }
}