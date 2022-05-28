import 'package:flutter/material.dart';
import 'package:lab_project_noteapp/Custom/CustomListTile.dart';
import 'package:lab_project_noteapp/DataBase/DB.dart';
import 'package:lab_project_noteapp/Screens/MyNotes.dart';
import 'package:lab_project_noteapp/constant.dart';

import '../DataBase/Note.dart';

class EditNote extends StatefulWidget {
  EditNote({required this.note, Key? key}) : super(key: key);
  Note note;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  static var db = DBHelper.dbHelper;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  int indexColor = 1;

  @override
  void initState() {
    // TODO: implement initState
    titleController.text = widget.note.noteTitle;
    descriptionController.text = widget.note.notedescription;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: colorsList[widget.note.noteColor],
        title: Row(
          children: [
            Text('Edit Note'),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 15),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.more_vert_outlined),
                  onPressed: () {
                    scaffoldKey.currentState!.showBottomSheet((context) =>
                        Container(
                          height: size.height / 2,
                          color: colorsList[widget.note.noteColor],
                          padding: EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomListTile(
                                    icon: Icons.share,
                                    text: 'Share with your friends'),
                                InkWell(
                                  onTap: () {
                                    db.deleteNote(widget.note.id);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyNotes()));
                                  },
                                  child: CustomListTile(
                                      icon: Icons.delete, text: 'Delete'),
                                ),
                                CustomListTile(
                                    icon: Icons.content_copy_rounded,
                                    text: 'Duplicate'),
                                SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                      padding: EdgeInsets.all(15),
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
                                                child: Icon(Icons.check),
                                              ),
                                              SizedBox(
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
                                                  widget.note.noteColor = i;
                                                  indexColor = i;
                                                });
                                              },
                                              child: CircleAvatar(
                                                backgroundColor: colorsList[i],
                                                radius: 25,
                                              ),
                                            ),
                                            SizedBox(
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
                  icon: Icon(Icons.check),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Note note = Note(
                          id: widget.note.id,
                          noteTitle: titleController.text,
                          notedescription: descriptionController.text,
                          noteColor: indexColor);
                      DBHelper.dbHelper.updateNote(note, widget.note.id);
                      setState(() {
                        if (indexColor < colorsList.length) {
                          ++indexColor;
                        } else
                          indexColor = 1;
                      });

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyNotes())).then((value) {setState(() {
                            
                          });});
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          titleController.text = widget.note.noteTitle;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: widget.note.noteTitle,
                          hintStyle: TextStyle(color: mainColor, fontSize: 20)),
                    ),
                    TextFormField(
                      controller: descriptionController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          descriptionController.text =
                              widget.note.notedescription;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: widget.note.notedescription,
                          hintStyle: TextStyle(
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
