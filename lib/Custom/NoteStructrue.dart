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
// import 'package:flutter/material.dart';

// class NoteCard extends StatelessWidget {
//   //late int id;
//   // late String title;
//   // late String content;
//    late Color note_color = Colors.yellow;

//   // const NoteCard({
//   //   Key? key,
    
//   //   // required this.deviceSize,
//   //   // required this.title,
//   //   // required this.content,
//   //   // required this.note_color,
//   // }) : super(key: key);

//   //final Size deviceSize;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => {
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) => EditNote(
//         //       id: id,
//         //       content: content,
//         //       title: title,
//         //       note_color: note_color,
//         //     ),
//         //   ),
//         // ),
//       },
//       child: Container(
//         height: 100,
//         width: 300,
//         padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
//         margin: const EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           shape: BoxShape.rectangle,
//           border: Border(
//             left: BorderSide(color: note_color, width: 5),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Color.fromARGB(255, 177, 177, 177),
//               offset: Offset(0.0, 1.0), //(x,y)
//               blurRadius: 3.0,
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'title',
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'Open sans',
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Flexible(
//               child: Text(
//                 'content',
//                 maxLines: 2,
//                 softWrap: true,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.normal,
//                   fontFamily: 'Open sans',
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
