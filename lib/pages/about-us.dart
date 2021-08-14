import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/loading_effect.dart';

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
                          Row(
                            children: [
                              FacebookButton(
                                onPressed: () {},
                              ),
                              TwitterButton(
                                onPressed: () {},
                              ),
                              GithubButton(
                                onPressed: () {},
                              ),
                              InstagramButton(
                                onPressed: () {},
                              ),
                              LinkedinButton(
                                onPressed: () {},
                              ),
                              MicrosoftButton(
                                onPressed: () {},
                              ),
                              GoogleButton(
                                onPressed: () {},
                              ),
                            ],
                          ),
                          Text(
                              '-----------------------------------------------------------------------------------------------'),
                          Text('Developed By: ' + mydata['name']),
                          Text('Contact No: ' + mydata['phone']),
                          Text('Location: ' + mydata['location']),
                        ],
                      ),
                    );
                  });
        },
      ),
    );
  }
}
