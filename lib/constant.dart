import 'package:flutter/material.dart';

Color basicColor = Color(0xff1321E0);
Color backgroundColor = Color(0xffF8FCFF);
const Color mainColor = Color(0xff1321E0);
const List<Color> colorsList = [
  Color(0xffFFFFFF),
  Color(0xffF28B81),
  Color(0xffF7BD02),
  Color(0xffFBF476),
  Color(0xffCDFF90),
  Color(0xffA7FEEB),
  Color(0xffCBF0F8),
  Color(0xffAFCBFA),
  Color(0xffD7AEFC),
  Color(0xffFBCFE9),
  Color(0xffE6C9A9),
  Color(0xffE9EAEE),
];
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:note_lab/Widgets/CustomText.dart';
// import '../Helpers/colors.dart';

// class NoteWidgets extends StatelessWidget {
//   late Map<String, dynamic>? data;
//   NoteWidgets({this.data});
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       height: size.height * 0.12,
//       width: size.width * 0.90,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 1,
//             blurRadius: 2,
//             offset: Offset(0, 3), 
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             height: size.height * 0.12,
//             width: size.width * 0.015,
//             decoration: BoxDecoration(
//                 color: Color(data!['color']),
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     bottomLeft: Radius.circular(30))),
//           ),
//           SizedBox(
//             width: 8,
//           ),
//           Column(
//             children: [
//               CustomText(
//                 title: data!['title'],
//                 size: 18,
//                 color: colors.primarycolor,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               CustomText(title: data!['description'], size: 13),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
