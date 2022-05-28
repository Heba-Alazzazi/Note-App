
import 'package:flutter/material.dart';
import 'package:lab_project_noteapp/constant.dart';

class EmptyNote extends StatelessWidget {
  const EmptyNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 150, child: Image.asset('assets/images/Empty.jpeg')),
          const Text(
            'No Notes :(',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 13, 89, 156)),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'You have no task to do.',
            style: TextStyle(
                fontSize: 15, color: Color.fromARGB(255, 163, 165, 167)),
          ),

        ],
      )),
    );
  }
}
