import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/loading_effect.dart';
import 'package:vipcoder/components/title.dart';
import 'package:vipcoder/components/upcoming-course-Box.dart';
import 'package:vipcoder/pages/All-Upcoming.dart';

Future getUpcomingCourse() async {
  var response = await Api().getData('upcoming');
  var data = json.decode(response.body)['data'];
  return data;
}

Widget upComingCourse(BuildContext context) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AllUpcomingCourses()));
        },
        child: title("Upcoming Class"),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 145,
            child: FutureBuilder(
              future: getUpcomingCourse(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data == null
                      ? Center(
                          child: loadingEffect(),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            var mydata = snapshot.data[index];

                            return upComingCourseBox(
                              context,
                              mydata['course_id'],
                              mydata['course'],
                              mydata['date'],
                              mydata['time'],
                              mydata['type'],
                              mydata['id'],
                            );
                          },
                        );
                } else if (snapshot.hasError) {
                  return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Text('Check Your Internet Connectivity!!!'));
                } else {
                  return loadingEffect();
                }
              },
            ),
          ),
        ),
      )
    ],
  );
}
