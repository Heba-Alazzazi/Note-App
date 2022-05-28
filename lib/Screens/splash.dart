import 'package:flutter/material.dart';
import 'package:lab_project_noteapp/DataBase/DB.dart';
import 'package:lab_project_noteapp/Screens/MyNotes.dart';
import 'package:lab_project_noteapp/constant.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // theme: ThemeData(fontFamily: 'Open Sans'),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: backgroundColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'assets/images/Splash.jpeg',
                  width: 200,
                  height: 200,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        primary: mainColor,
                        minimumSize: Size(250, 45)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyNotes()));
                    },
                    child: Text('Get Started'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
