import 'package:flutter/material.dart';
import 'package:vipcoder/pages/syllabus.dart';

class CoursePage extends StatefulWidget {
  final String? name;
  CoursePage({this.name}); //constructor
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SyllabusScreen()));
                },
                leading: Image.network(
                    'https://www.fastcomet.com/blog/wp-content/uploads/2019/09/fastcomet-laravel-6.png'),
                title: Text(
                  "Laravel",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                subtitle: Text("Duration: 3Months"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.network(
                    'https://assets-global.website-files.com/5e3c45dea042cf97f3689681/5e417cd336a72b06a86c73e7_Flutter-Tutorial-Header%402x.jpg'),
                title: Text(
                  "Flutter",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                subtitle: Text("Duration: 3Months"),
              ),
            ),
            ListTile(
              leading: Image.network(
                  'https://assets-global.website-files.com/5e3c45dea042cf97f3689681/5e417cd336a72b06a86c73e7_Flutter-Tutorial-Header%402x.jpg'),
              title: Text(
                "React Js",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              subtitle: Text("Duration: 3Months"),
            ),
            ListTile(
              leading: Image.network(
                  'https://assets-global.website-files.com/5e3c45dea042cf97f3689681/5e417cd336a72b06a86c73e7_Flutter-Tutorial-Header%402x.jpg'),
              title: Text(
                "Vue Js",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              subtitle: Text("Duration: 3Months"),
            ),
          ],
        ),
      ),
    );
  }
}
