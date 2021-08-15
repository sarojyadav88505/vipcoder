import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/loading_effect.dart';
import 'package:vipcoder/const/const.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  Future getContact() async {
    var response = await Api().getData('about');
    var data = json.decode(response.body)['data'];
    return data;
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getContact(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              mydata['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          DefaultTextStyle(
                            style: const TextStyle(
                                fontSize: 28.0, color: Colors.black),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                WavyAnimatedText('Contact Developer!'),
                              ],
                              isRepeatingAnimation: true,
                              onTap: () {
                                print("Tap Event");
                              },
                            ),
                          ),
                          // Text(
                          //   'Contact Developer!',
                          //   style: TextStyle(fontSize: 28, color: primaryColor),
                          // ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\nName: ',
                                  style: TextStyle(
                                      fontSize: 20, color: primaryColor),
                                ),
                                TextSpan(
                                  text: mydata['name'] + '\n',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'Contact No: ',
                                  style: TextStyle(
                                      fontSize: 20, color: primaryColor),
                                ),
                                TextSpan(
                                  text: mydata['phone'] + '\n',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'Location: ',
                                  style: TextStyle(
                                      fontSize: 20, color: primaryColor),
                                ),
                                TextSpan(
                                  text: mydata['location'] + '\n',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'We are on Social Media.',
                            style: TextStyle(fontSize: 28, color: primaryColor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FacebookButton(
                                onPressed: () {
                                  _launchURL(
                                      'https://www.facebook.com/profile.php?id=100051618122414');
                                },
                              ),
                              // TwitterButton(
                              //   onPressed: () {
                              //     _launchURL('url');
                              //   },
                              // ),
                              GithubButton(
                                onPressed: () {
                                  _launchURL(
                                      'https://github.com/sarojyadav88505');
                                },
                              ),
                              InstagramButton(
                                onPressed: () {
                                  _launchURL(
                                      'https://www.instagram.com/vipcoding/');
                                },
                              ),
                              LinkedinButton(
                                onPressed: () {
                                  _launchURL(
                                      'https://www.linkedin.com/in/saroj-yadav-b69311111/');
                                },
                              ),
                              GoogleButton(
                                onPressed: () {
                                  _launchURL('http://carelesscoder.com/');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
        },
      ),
    );
  }
}
