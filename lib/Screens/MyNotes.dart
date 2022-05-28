import 'package:flutter/material.dart';
import 'package:lab_project_noteapp/Custom/NoteStructrue.dart';
import 'package:lab_project_noteapp/DataBase/Note.dart';
import 'package:lab_project_noteapp/Screens/emptyNote.dart';
import 'package:lab_project_noteapp/Screens/newNote.dart';

import '../DataBase/DB.dart';
import '../constant.dart';

class MyNotes extends StatefulWidget {
  MyNotes({Key? key}) : super(key: key);

  State<MyNotes> createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> {
  static var db = DBHelper.dbHelper;
  int length = DBHelper.allNotes.length;
  late List<Note> notes;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: const Text('My Notes'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Container(
            width: 60,
            height: 60,
            child: const Icon(
              Icons.add,
              size: 40,
            ),
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient:
                    const LinearGradient(tileMode: TileMode.repeated, colors: [
                  Colors.purple,
                  Color(0xff1321E0),
                  Colors.purple,
                ])),
          ),
          onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (BuildOwner) => NewNote()))
                .then((value) {
              setState(() {});
            });
          },
        ),
        body: FutureBuilder(
          future: db.getAllNote(),
          builder: (context, snapshot) {
            if (!snapshot.hasData && snapshot.data == null) {
              return const EmptyNote();
            } 
              return ListView.builder(
                  itemCount: (snapshot.data as List<Note>).length,
                  itemBuilder: (context, index) {
                    print((snapshot.data as List<Note>).length);
                    // if ((snapshot.data as List<Note>).length == 0) {
                    //   return EmptyNote();
                    // }
                    return NoteStructrue(
                        note: (snapshot.data as List<Note>)[index]);
                  });
            
          },
        ));
  }
}
