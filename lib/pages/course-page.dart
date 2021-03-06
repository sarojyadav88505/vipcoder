import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/loading_effect.dart';
import 'package:vipcoder/const/const.dart';
import 'package:vipcoder/pages/syllabus.dart';

class CoursePage extends StatefulWidget {
  final int? id;
  final String? name;
  CoursePage({this.name, this.id}); //constructor
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  Future getCourses(int id) async {
    var response = await Api().getData('categories/' + id.toString());
    var data = json.decode(response.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: getCourses(widget.id!),
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
                            return Card(
                              child: ListTile(
                                trailing: Icon(
                                  Icons.arrow_right,
                                  size: 30,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SyllabusScreen(
                                        id: mydata['id'],
                                      ),
                                    ),
                                  );
                                },
                                leading: Container(
                                  width: 90,
                                  height: 55,
                                  child: Image.network(
                                    url + mydata['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  mydata['name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                subtitle:
                                    Text("Duration: " + mydata['duration']),
                              ),
                            );
                          },
                        );
                } else if (snapshot.hasError) {
                  return Text("Check Your Internet Connection!!!");
                } else {
                  return loadingEffect();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
