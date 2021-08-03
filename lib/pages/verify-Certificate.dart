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
                  Container(
                    width: 390,
                    height: 250,
                    // color: Colors.red,
                    child: Image(
                      // fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/certificate.png',
                      ),
                    ),
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
                    "#Note: You Will Found Your Certificate No. in Certificate Provided By 'VIPCODING'",
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
                                MaterialStateProperty.all(ancentColor)),
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
                                      title: Text('sorry😢'),
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
                                            child: Text("OK"))
                                      ],
                                    );
                                  });
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (builder) {
                                    return AlertDialog(
                                      title: Text(
                                        'Congratulation🎉',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: Container(
                                        height: 80,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "This Certificate Belongs To",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              data[0]['name'],
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              data[0]['course'],
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("OK"))
                                      ],
                                    );
                                  });
                            }
                          }
                        },
                        child: Text(
                          'Verify Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
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
