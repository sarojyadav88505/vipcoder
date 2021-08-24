import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/loading_effect.dart';
import 'package:vipcoder/components/title.dart';
import 'package:vipcoder/components/trending-Course-Box.dart';
import 'package:vipcoder/pages/All-Trending.dart';

Future getTrendingCourse() async {
  var response = await Api().getData('trendingcourse');
  var data = json.decode(response.body);
  return data;
}

Widget popularCourse(BuildContext context) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AllTrendingCourse()));
        },
        child: title('Trending Course'),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder(
          future: getTrendingCourse(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return snapshot.data == null
                  ? Center(
                      child: loadingEffect(),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var mydata = snapshot.data[index];
                        // print(mydata['name'].toString());
                        return polularCourseBox(
                          context,
                          mydata['name'],
                          mydata['duration'],
                          mydata['image'],
                          mydata['id'],
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
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: loadingEffect(),
              );
            }
          },
        ),
      )
    ],
  );
}
