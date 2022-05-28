import 'package:flutter/material.dart';

class Note {
  late int? id;
  late String noteTitle;
  late String notedescription;
  late int noteColor;
  Note(
      {this.id,
      required this.noteTitle,
      required this.notedescription,
      required this.noteColor});

  Note.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    noteTitle = map['noteTitle'];
    notedescription = map['notedescription'];
    noteColor = map['noteColor'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['noteTitle'] = noteTitle;
    map['notedescription'] = notedescription;
    map['noteColor'] = noteColor;
    return map;
  }

  String toString() {
    return ' id $id ,, title $noteTitle ,, des $notedescription ,, color $noteColor';
  }
}
