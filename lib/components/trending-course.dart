import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/title.dart';
import 'package:vipcoder/components/trending-Course-Box.dart';

Future getTrendingCourse() async {
  var response = await Api().getData('trending');
  var data = json.decode(response.body);
  return data;
}

Widget popularCourse() {
  return Column(
    children: [
      title('Trending Course'),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FutureBuilder(
            future: getTrendingCourse(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var mydata = snapshot.data[index];
                    return polularCourseBox(
                        mydata['name'], mydata['duration'], mydata['image']);
                  },
                );
              } else if (snapshot.hasError) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/cry.gif'),
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/loading.gif'),
                );
              }
            },
          ))
    ],
  );
}
