import 'package:flutter/material.dart';
import 'package:vipcoder/const/const.dart';

Widget polularCourseBox(String name, String duration, String image) {
  return Card(
    // color: primaryColor,
    child: Container(
      padding: EdgeInsets.all(8),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Image(
              image: NetworkImage(url + '$image'),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "$name",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          Text("Duration: $duration")
        ],
      ),
    ),
  );
}
