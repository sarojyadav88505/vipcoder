import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/const/const.dart';

class SyllabusScreen extends StatefulWidget {
  final int? id;
  SyllabusScreen({this.id});
  @override
  _SyllabusScreenState createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
  var data;
  bool isLoading = true;
  Future getsyllabus(int id) async {
    var response = await Api().getData('syllabus/' + id.toString());
    data = json.decode(response.body);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getsyllabus(widget.id!);
  }

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
          onPressed: () {
            showDialog(
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    title: Text("Apply Now"),
                    content: Container(
                      height: 200,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(hintText: 'Full Name'),
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'E-mail'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'mobile No'),
                            keyboardType: TextInputType.phone,
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'Address'),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel')),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(primaryColor)),
                              onPressed: () {},
                              child: Text('Apply Now')),
                        ],
                      )
                    ],
                  );
                });
          },
          child: Text(
            "Apply Now",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Syllabus"),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Image
                  Container(
                    width: width,
                    height: 200,
                    child: Image.network(
                      "http://192.168.1.4:8000/" + data['image'],
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
                                  data['name'],
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("Durations: " + data['duration']),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 25, 10, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Fee: NPR." + data['fee'].toString(),
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
                  Html(data: data['syllabus'])
                ],
              ),
            ),
    );
  }
}
