import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'song.dart';
//https://docs.objectbox.io/relations#many-to-many-n-m
@Entity()
class Tag{
  @Id()
  int id;
  final String name;
  final int colourIndex;
  final bool userDefined;

  @Backlink()
  final songs = ToMany<Song>();
  Tag({required this.name,required this.colourIndex,this.id = 0,this.userDefined = false}){
    if (colourIndex >= colours.length){throw 'colourIndex ${colourIndex} out of range for colours list. Tag Name: ${name}';}
  }

  Color colour(){
    return colours[colourIndex];
  }
  static const List<Color> colours = const[
    Colors.indigo,
    Colors.brown,
    Colors.red,
    Colors.blueGrey,
    Colors.deepOrangeAccent,
    Colors.green,
    Colors.blue,
    Colors.purple,];

    @override
    String toString() {
        return 'Tag(id: $id, name: $name, colour: ${colours[colourIndex].toString()})';
    }
}
