import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/loading_effect.dart';
import 'package:vipcoder/const/const.dart';

class NotesDownload extends StatefulWidget {
  @override
  _NotesDownloadState createState() => _NotesDownloadState();
}

class _NotesDownloadState extends State<NotesDownload> {
  Future getNotes() async {
    var response = await Api().getData('download');
    var data = json.decode(response.body)['data'];
    return data;
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download'),
      ),
      body: FutureBuilder(
        future: getNotes(),
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
                        children: [
                          Card(
                            child: ListTile(
                              onTap: () {},
                              title: Text(mydata['title']),
                              subtitle: Text(mydata['created_at']),
                              trailing: InkWell(
                                onTap: () {
                                  _launchURL(mydata['document']);
                                },
                                child: Icon(
                                  Icons.arrow_downward,
                                  size: 30,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
