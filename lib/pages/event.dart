import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/loading_effect.dart';
import 'package:vipcoder/pages/Event-detail-page.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  Future getEvent() async {
    var response = await Api().getData('event');
    var data = json.decode(response.body)['data'];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: FutureBuilder(
        future: getEvent(),
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
                                  builder: (context) => EventsDetailsPage(
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
    );
  }
}
