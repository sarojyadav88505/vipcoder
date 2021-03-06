import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/loading_effect.dart';
import 'package:vipcoder/pages/notice-details-Page.dart';

// ignore: camel_case_types
class notice extends StatefulWidget {
  @override
  _noticeState createState() => _noticeState();
}

// ignore: camel_case_types
class _noticeState extends State<notice> {
  Future getNotice() async {
    var response = await Api().getData('notice');
    var data = json.decode(response.body)['data'];
    return data;
  }

  Future refresh() async {
    await Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      notice();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notices'),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: FutureBuilder(
          future: getNotice(),
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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NoticePage(
                                      title: mydata['title'], //constructor
                                      description: mydata['description'],
                                      image: mydata['image'],
                                    ),
                                  ),
                                );
                              },
                              title: Text(mydata['title']),
                              subtitle: Text(mydata['created_at']),
                              trailing: Icon(
                                Icons.arrow_right,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ));
                    },
                  );
          },
        ),
      ),
    );
  }
}
