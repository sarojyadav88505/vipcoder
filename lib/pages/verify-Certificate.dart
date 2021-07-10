import 'package:flutter/material.dart';
import 'package:vipcoder/const/const.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({Key? key}) : super(key: key);

  @override
  _CertificateScreenState createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
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
                  decoration: InputDecoration(
                      hintText: 'Enter your Certificate No.',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10)),
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
                        onPressed: () {},
                        child: Text(
                          'Verify Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
