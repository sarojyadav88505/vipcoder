import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/blogBox.dart';
import 'package:vipcoder/components/loading_effect.dart';
import 'package:vipcoder/components/title.dart';

Future getBlogs() async {
  var response = await Api().getData('blog');
  var data = json.decode(response.body)['data'];
  return data;
}

Widget blogs() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        title('Blogs'),
        FutureBuilder(
          future: getBlogs(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var mydata = snapshot.data[index];
                  return blogBox(
                      context,
                      mydata['title'],
                      mydata['description'],
                      mydata['image'],
                      mydata['created_at']);
                },
              );
            } else if (snapshot.hasError) {
              return Text('Server Error');
            } else {
              return Center(
                child: loadingEffect(),
              );
            }
          },
        ),
      ],
    ),
  );
}
