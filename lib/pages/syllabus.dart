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
  GlobalKey<FormState> _key = new GlobalKey<FormState>();
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
                barrierDismissible: false,
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    title: Text("Enquiry Now"),
                    content: Container(
                      height: 300,
                      child: SingleChildScrollView(
                        child: Form(
                          key: _key,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Enquiry about👉 " + data['name']),
                              Divider(color: ancentColor),
                              TextFormField(
                                validator: (value) =>
                                    value!.isEmpty ? 'required' : null,
                                controller: studentName,
                                decoration:
                                    InputDecoration(hintText: 'Full Name'),
                              ),
                              TextFormField(
                                validator: (value) =>
                                    value!.isEmpty ? 'required' : null,
                                controller: email,
                                decoration: InputDecoration(hintText: 'E-mail'),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              TextFormField(
                                validator: (value) =>
                                    value!.isEmpty ? 'required' : null,
                                controller: mobile,
                                decoration:
                                    InputDecoration(hintText: 'mobile No'),
                                keyboardType: TextInputType.phone,
                              ),
                              TextFormField(
                                validator: (value) =>
                                    value!.isEmpty ? 'required' : null,
                                controller: address,
                                decoration:
                                    InputDecoration(hintText: 'Address'),
                              ),
                              TextFormField(
                                validator: (value) =>
                                    value!.isEmpty ? 'required' : null,
                                controller: message,
                                decoration:
                                    InputDecoration(hintText: 'Message'),
                                maxLines: 4,
                              ),
                            ],
                          ),
                        ),
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
                              onPressed: () async {
                                if (_key.currentState!.validate()) {
                                  // write a code which send json data to API
                                  Map jsonData = {
                                    'name': studentName.text,
                                    'email': email.text,
                                    'mobile': mobile.text,
                                    'address': address.text,
                                    'message': message.text,
                                    'course_id': data['id'],
                                  };

                                  var response =
                                      await Api().postData(jsonData, 'enquiry');
                                  var result = json.decode(response.body);
                                  print(result);
                                  if (result['message'] == 'success') {
                                    Navigator.pop(context);
                                    showDialog(
                                        context: context,
                                        builder: (builder) {
                                          return AlertDialog(
                                            title: Text("Message"),
                                            content: Text(
                                                "Thank You!! \nWe will contact you Soon"),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Ok"))
                                            ],
                                          );
                                        });
                                  }
                                }
                              },
                              child: Text('Send')),
                        ],
                      )
                    ],
                  );
                });
          },
          child: Text(
            "Enquiry",
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
                      url + data['image'],
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
