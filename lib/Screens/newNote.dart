import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab_project_noteapp/Custom/CustomListTile.dart';
import 'package:lab_project_noteapp/DataBase/DB.dart';
import 'package:lab_project_noteapp/Screens/MyNotes.dart';
import 'package:lab_project_noteapp/constant.dart';

import '../DataBase/Note.dart';

class NewNote extends StatefulWidget {
  NewNote({Key? key}) : super(key: key);

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String date = DateFormat('h:mm a , d MMM').format(DateTime.now());
  int indexColor = 1;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: basicColor,
        title: const Text('New Note'),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {
                    scaffoldKey.currentState!.showBottomSheet((context) =>
                        Container(
                          height: size.height / 2,
                          color: basicColor,
                          padding: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomListTile(
                                    icon: Icons.share,
                                    text: 'Share with your friends'),
                                CustomListTile(
                                    icon: Icons.delete, text: 'Delete'),
                                CustomListTile(
                                    icon: Icons.content_copy_rounded,
                                    text: 'Duplicate'),
                                SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                      padding: const EdgeInsets.all(15),
                                      shrinkWrap: true,
                                      itemCount: colorsList.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i) {
                                        if (colorsList[i] == basicColor) {
                                          return Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: colorsList[i],
                                                radius: 25,
                                                child: const Icon(Icons.check),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              )
                                            ],
                                          );
                                        }
                                        return Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  basicColor = colorsList[i];
                                                  indexColor = i;
                                                });
                                              },
                                              child: CircleAvatar(
                                                backgroundColor: colorsList[i],
                                                radius: 25,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            )
                                          ],
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                        ));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      late int taskId;
                      Note note = Note(
                          noteTitle: titleController.text,
                          notedescription: descriptionController.text,
                          noteColor: indexColor);
                      taskId = await DBHelper.dbHelper.insertNewNote(note);

                      setState(() {
                        note.id = taskId;
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyNotes()));
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              date,
              style: const TextStyle(
                  color: Color.fromARGB(255, 195, 193, 193),
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type Somthing...',
                          hintStyle:
                              TextStyle(color: basicColor, fontSize: 20)),
                    ),
                    const Divider(
                      height: 15,
                      thickness: 5,
                      color: Color.fromARGB(255, 237, 234, 234),
                    ),
                    TextFormField(
                      controller: descriptionController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This is required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type Somthing...',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 180, 173, 250),
                              fontSize: 18)),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
