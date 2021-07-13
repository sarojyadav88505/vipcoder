import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/title.dart';
import 'package:vipcoder/components/upcoming-course-Box.dart';

Future getUpcomingCourse() async {
  var response = await Api().getData('upcoming');
  var data = json.decode(response.body)['data'];
  return data;
}

Widget upComingCourse(BuildContext context) {
  return Column(
    children: [
      title("Upcoming Course"),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 135,
            child: FutureBuilder(
              future: getUpcomingCourse(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var mydata = snapshot.data[index];

                      return upComingCourseBox(
                          mydata['course'], mydata['date'], mydata['time']);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('assets/cry.gif'),
                  );
                } else {
                  return Image.asset('assets/loading.gif');
                }
              },
            )),
      )
    ],
  );
}
