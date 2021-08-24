import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/loading_effect.dart';
import 'package:vipcoder/components/trending-Course-Box.dart';

class AllTrendingCourse extends StatefulWidget {
  @override
  _AllTrendingCourseState createState() => _AllTrendingCourseState();
}

class _AllTrendingCourseState extends State<AllTrendingCourse> {
  Future getTrendingCourse() async {
    var response = await Api().getData('alltrending');
    var data = json.decode(response.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Courses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                      child: Text('Check Your Internet Connectivity!!!'),
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
        ),
      ),
    );
  }
}
