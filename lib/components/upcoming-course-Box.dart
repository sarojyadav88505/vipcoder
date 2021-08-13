import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/const/const.dart';
import 'package:vipcoder/pages/syllabus.dart';

GlobalKey<FormState> _key = new GlobalKey<FormState>();

Widget upComingCourseBox(BuildContext context, int courseID, String name,
    String date, String time, String type, int upcomingID) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 200,
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SyllabusScreen(
                                id: courseID,
                              )));
                },
                child: Text(
                  "$name",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Divider(
                color: textColor,
              ),
              Row(
                children: [
                  Icon(
                    Icons.event_available,
                    size: 12,
                    color: textColor,
                  ),
                  SizedBox(width: 3),
                  Text(
                    "$date",
                    style: TextStyle(
                      fontSize: 13,
                      color: textColor,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    size: 12,
                    color: textColor,
                  ),
                  SizedBox(width: 3),
                  Text(
                    "$time",
                    style: TextStyle(
                      fontSize: 13,
                      color: textColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "| $type",
                    style: TextStyle(
                      fontSize: 13,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                  ),
                  child: Text(
                    "Apply Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: textColor),
                  ),
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (builder) {
                          return AlertDialog(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Fill up details."),
                                Image.asset('assets/form.png', width: 20)
                              ],
                            ),
                            content: Container(
                              height: 250,
                              child: Form(
                                key: _key,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Divider(color: ancentColor),
                                      TextFormField(
                                        validator: (value) =>
                                            value!.isEmpty ? 'required' : null,
                                        controller: studentName,
                                        decoration: InputDecoration(
                                            hintText: 'Full Name'),
                                      ),
                                      TextFormField(
                                        validator: (value) =>
                                            value!.isEmpty ? 'required' : null,
                                        controller: email,
                                        decoration:
                                            InputDecoration(hintText: 'E-mail'),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                      TextFormField(
                                        validator: (value) =>
                                            value!.isEmpty ? 'required' : null,
                                        controller: mobile,
                                        decoration: InputDecoration(
                                            hintText: 'mobile No'),
                                        keyboardType: TextInputType.phone,
                                      ),
                                      TextFormField(
                                        validator: (value) =>
                                            value!.isEmpty ? 'required' : null,
                                        controller: address,
                                        decoration: InputDecoration(
                                            hintText: 'Address'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel')),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                primaryColor)),
                                    onPressed: () async {
                                      if (_key.currentState!.validate()) {
                                        // write a code which send json data to API
                                        Map jsonData = {
                                          'name': studentName.text,
                                          'email': email.text,
                                          'mobile': mobile.text,
                                          'address': address.text,
                                          "upcoming_id": upcomingID,
                                        };

                                        var response = await Api().postData(
                                            jsonData, 'studentregister');
                                        var result = json.decode(response.body);
                                        print(result);
                                        if (result['message'] == 'success') {
                                          // Clear Text Editing Controller
                                          studentName.clear();
                                          email.clear();
                                          mobile.clear();
                                          address.clear();

                                          Navigator.pop(context);
                                          // Message Send Vayo Vaneyra Popup Dialog ko design Start
                                          showDialog(
                                            context: context,
                                            builder: (builder) {
                                              return AlertDialog(
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Message",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 25),
                                                    ),
                                                    Container(
                                                      height: 20,
                                                      width: 35,
                                                      child: Image.asset(
                                                          'assets/msg.png'),
                                                    ),
                                                  ],
                                                ),
                                                content: Container(
                                                  height: 80,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text('🙏 Thank You 🙏'),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "Message Sent",
                                                          ),
                                                          Container(
                                                            height: 20,
                                                            width: 30,
                                                            child: Image.asset(
                                                                'assets/tick.png'),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        'We Will Contact You Shortly.',
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(
                                                                    primaryColor)),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Ok",
                                                      style: TextStyle(
                                                          color: textColor),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );

                                          // Message Send Vayo Vaneyra Popup Dialog ko design End
                                        }
                                      }
                                    },
                                    child: Text('Submit'),
                                  ),
                                ],
                              )
                            ],
                          );
                        });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
