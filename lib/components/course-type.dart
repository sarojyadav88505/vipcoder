import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/course-type-Box.dart';
import 'package:vipcoder/components/loading_effect.dart';
import 'package:vipcoder/pages/course-page.dart';

Future getCourseType() async {
  var response = await Api().getData('categories');
  var data = json.decode(response.body);
  return data;
  // print(data);
}

Widget courseType(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: getCourseType(),
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
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CoursePage(
                                      name: mydata['name'],
                                      id: mydata['id'],
                                    ),
                                  ),
                                );
                              },
                              child: courseTypeBox(
                                mydata['name'],
                              ),
                            );
                          },
                        );
                } else if (snapshot.hasError) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Text('Check Your Internet Connectivity'),
                  );
                } else {
                  return loadingEffect();
                }
              },
            )),
      ],
    ),
  );
}
