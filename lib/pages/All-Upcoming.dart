import 'package:flutter/material.dart';
import 'package:vipcoder/components/loading_effect.dart';
import 'package:vipcoder/components/upcoming-course-Box.dart';
import 'package:vipcoder/components/upcoming-course.dart';

class AllUpcomingCourses extends StatefulWidget {
  @override
  _AllUpcomingCoursesState createState() => _AllUpcomingCoursesState();
}

class _AllUpcomingCoursesState extends State<AllUpcomingCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('upcoming Courses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: FutureBuilder(
                  future: getUpcomingCourse(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data == null
                          ? Center(
                              child: loadingEffect(),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
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
                        child: Image.asset('assets/cry.gif'),
                      );
                    } else {
                      return loadingEffect();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
