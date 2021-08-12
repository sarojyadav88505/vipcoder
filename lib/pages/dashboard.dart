import 'package:flutter/material.dart';
import 'package:vipcoder/components/blog.dart';
import 'package:vipcoder/components/carousel.dart';
import 'package:vipcoder/components/course-type.dart';
import 'package:vipcoder/components/drawer.dart';
import 'package:vipcoder/components/trending-course.dart';
import 'package:vipcoder/components/upcoming-course.dart';
import 'package:vipcoder/pages/notice.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future refresh() async {
    await Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      carousel(context);
      courseType(context);
      upComingCourse(context);
      popularCourse();
      blog();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Start Bottom NavigationBar is Used For Company Highlight
        // bottomNavigationBar: Container(
        //   width: MediaQuery.of(context).size.width,
        //   height: 12,
        //   alignment: Alignment.center,
        //   child: RichText(
        //     text: TextSpan(
        //       children: [
        //         TextSpan(
        //             text: "Powered by",
        //             style: TextStyle(
        //                 color: Colors.black,
        //                 fontWeight: FontWeight.w400,
        //                 fontSize: 8)),
        //         TextSpan(
        //             text: " Vipcoding",
        //             style: TextStyle(
        //                 color: primaryColor,
        //                 fontWeight: FontWeight.w800,
        //                 fontSize: 8))
        //       ],
        //     ),
        //   ),
        // ),
        // Bottom NAvigationBar End
        drawer: myDrawer(context), //mydrawer widget is in component folder
        appBar: AppBar(
          title: Text("ViP CODING"),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => notice()));
                  },
                  icon: Icon(
                    Icons.circle_notifications,
                    size: 40,
                  )),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Slider Component
                carousel(context),
                // Course Type Components
                courseType(context),
                // Upcoming Courses Components
                upComingCourse(context),
                // Popular Courses
                popularCourse(),
                // testimonial(context),
                // blog
                blog()
              ],
            ),
          ),
        ));
  }
}
