import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile(
      {Key? key, required IconData this.icon, required String this.text})
      : super(key: key);
  IconData icon;
  String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          radius: 17,
          backgroundColor: Color.fromARGB(255, 222, 220, 220),
          child: Icon(
            icon,
            size: 25,
            color: Colors.black,
          )),
      title: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
