import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'song.dart';
//https://docs.objectbox.io/relations#many-to-many-n-m
@Entity()
class Tag{
  @Id()
  int id;
  final String name;
  final int colourId;
  final bool userDefined;

  @Backlink()
  final songs = ToMany<Song>();
  Tag({required this.name,required this.colourId,this.id = 0,this.userDefined = false}){
    if (colourId >= colours.length){throw 'colourId ${colourId} out of range for colours list. Tag Name: ${name}';}
  }

  Color colour(){
    return colours[colourId];
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
}
