import 'package:flutter/material.dart';
import 'package:lab_project_noteapp/Screens/editNotes.dart';
import 'package:lab_project_noteapp/constant.dart';

import '../DataBase/DB.dart';
import '../DataBase/Note.dart';

class NoteStructrue extends StatelessWidget {
  NoteStructrue({required this.note});
  Note note;
  static var db = DBHelper.dbHelper;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => EditNote(note: this.note)));
      },
      child: Container(
          height: 120,
          width: double.infinity,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 218, 212, 212),
                    blurRadius: 15,
                    spreadRadius: 3,
                    offset: Offset(2, 3))
              ]),
          child: Row(
            children: [
              Container(
                width: 8,
                //height: 50,
                decoration: BoxDecoration(
                  color: colorsList[note.noteColor],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.noteTitle,
                    style: TextStyle(
                        fontSize: 25,
                        color: mainColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    note.notedescription,
                    maxLines: 3,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
