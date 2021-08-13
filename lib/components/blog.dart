import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/title.dart';
import 'package:vipcoder/const/const.dart';
import 'package:vipcoder/pages/blogPage.dart';

Future getBlog() async {
  var response = await Api().getData('blog');
  var data = json.decode(response.body)['data'];
  return data;
}

Widget blog() {
  return Column(
    children: [
      title('Blogs'),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder(
          future: getBlog(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var mydata = snapshot.data[index];
                return Card(
                  color: textColor,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlogPage(
                            title: mydata['title'], //constructor
                            description: mydata['description'],
                            image: mydata['image'],
                          ),
                        ),
                      );
                    },
                    leading: Container(
                      child: Image.network(
                        mydata['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(mydata['title']),
                    subtitle: Text(mydata['created_at']),
                    trailing: Icon(
                      Icons.arrow_right,
                      size: 30,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    ],
  );
}
