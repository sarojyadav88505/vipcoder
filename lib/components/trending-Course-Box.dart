import 'package:flutter/material.dart';
import 'package:vipcoder/const/const.dart';

Widget polularCourseBox(String name, String duration, String image) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    color: primaryColor,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('$image'),
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$name",
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Duration: $duration",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
