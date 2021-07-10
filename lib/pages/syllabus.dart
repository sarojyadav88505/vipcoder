import 'package:flutter/material.dart';
import 'package:vipcoder/const/const.dart';

class SyllabusScreen extends StatefulWidget {
  @override
  _SyllabusScreenState createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(primaryColor),
          ),
          onPressed: () {},
          child: Text(
            "Apply Now",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Syllabus"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image
            Container(
              width: width,
              height: 200,
              child: Image.network(
                'https://assets-global.website-files.com/5e3c45dea042cf97f3689681/5e417cd336a72b06a86c73e7_Flutter-Tutorial-Header%402x.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Container
            Container(
              width: width,
              height: 55,
              color: Colors.grey.shade300,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Laravel PHP Framework",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text("Durations: 3 Months"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 25, 5, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Fee: NPR.18500/-",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Syllabus Content
          ],
        ),
      ),
    );
  }
}
