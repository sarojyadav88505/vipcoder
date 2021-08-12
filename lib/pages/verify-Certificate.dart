import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/const/const.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({Key? key}) : super(key: key);

  @override
  _CertificateScreenState createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  var data;
  Future verifyCertificate(String certificateNo) async {
    var response = await Api().getData('certificate/' + certificateNo);

    setState(() {
      data = json.decode(response.body)['data'];
    });
  }

  GlobalKey<FormState> _key = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify Certificate"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  SizedBox(height: 35),
                  Image(
                    // fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/certificate.png',
                    ),
                    width: 290,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Verify your Certificate",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "#Note: You Will Find Your Certificate No. in Certificate Provided By 'VIPCODING'",
                    style: TextStyle(color: Colors.grey.shade500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: certificateNo,
                    decoration: InputDecoration(
                      hintText: 'Enter your Certificate No.',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Required Certificate Number' : null,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                        ),
                        onPressed: () async {
                          if (_key.currentState!.validate()) {
                            var response = await Api()
                                .getData('certificate/' + certificateNo.text);
                            var data = json.decode(response.body)['data'];

                            if (data.isEmpty) {
                              showDialog(
                                context: context,
                                builder: (builder) {
                                  return AlertDialog(
                                    title: Text(
                                      'sorry😢',
                                      style: TextStyle(fontSize: 28),
                                    ),
                                    content: Container(
                                      height: 40,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Certificate Not Found"),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      )
                                    ],
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (builder) {
                                    return AlertDialog(
                                      title: Text(
                                        'Congratulation🎉',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: Container(
                                        height: 135,
                                        // width: 250,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Divider(),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          "This certificate number belongs to: ",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16),
                                                    ),
                                                    TextSpan(
                                                      text: data[0]['name'],
                                                      style: TextStyle(
                                                          color: primaryColor,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 16),
                                                    ),
                                                    TextSpan(
                                                      text: "\n course: ",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16),
                                                    ),
                                                    TextSpan(
                                                      text: data[0]['course'],
                                                      style: TextStyle(
                                                          color: primaryColor,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 16),
                                                    ),
                                                    TextSpan(
                                                      text: '.',
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 18),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("OK"),
                                        )
                                      ],
                                    );
                                  });
                            }
                          }
                        },
                        child: Text(
                          'Verify Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
