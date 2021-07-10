import 'package:flutter/material.dart';
import 'package:vipcoder/const/const.dart';

Widget upComingCourseBox(String name, String date, String time) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 160,
        color: upcomingBoxColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "$name",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.event_available,
                    size: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "$date",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    size: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "$time",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton.icon(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(15),
                      backgroundColor:
                          MaterialStateProperty.all(upcomingBoxColor),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_upward_sharp,
                      color: ancentColor,
                    ),
                    label: Text(
                      "Apply Now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: ancentColor),
                    )),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
