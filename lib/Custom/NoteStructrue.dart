import 'package:flutter/material.dart';
import 'package:lab_project_noteapp/Screens/editNotes.dart';
import 'package:lab_project_noteapp/constant.dart';
import '../DataBase/Note.dart';

// ignore: must_be_immutable
class NoteStructrue extends StatelessWidget {
  Note note;
  NoteStructrue({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EditNote(note: this.note)));
      },
      child: Container(
          height: 120,
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                    color: Color.fromARGB(255, 218, 212, 212),
                    blurRadius: 15,
                    spreadRadius: 3,
                    offset: Offset(2, 3))
              ]),
          child: Row(
            children: [
              Container(
                width: 8,
                decoration: BoxDecoration(
                  color: colorsList[note.noteColor],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.noteTitle,
                    style: const TextStyle(
                        fontSize: 25,
                        color: mainColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    note.notedescription,
                    maxLines: 3,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
