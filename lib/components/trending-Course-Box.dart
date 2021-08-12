import 'package:flutter/material.dart';
import 'package:vipcoder/const/const.dart';
import 'package:vipcoder/pages/syllabus.dart';

Widget polularCourseBox(
    BuildContext context, String name, String duration, String image, int id) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SyllabusScreen(
                    id: id,
                  )));
    },
    child: Card(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                url + '$image',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "$name",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: Colors.black),
            ),
            Text("Duration: $duration")
          ],
        ),
      ),
    ),
  );
}
