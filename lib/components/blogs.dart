import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/blogBox.dart';
import 'package:vipcoder/components/loading_effect.dart';
import 'package:vipcoder/components/title.dart';
import 'package:vipcoder/pages/All-Blog.dart';

Future getBlogs() async {
  var response = await Api().getData('blog');
  var data = json.decode(response.body)['data'];
  return data;
}

Widget blogs(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AllBlog()));
          },
          child: title('Blogs'),
        ),
        FutureBuilder(
          future: getBlogs(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
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
                        return blogBox(
                            context,
                            mydata['title'],
                            mydata['description'],
                            mydata['image'],
                            mydata['created_at']);
                      },
                    );
            } else if (snapshot.hasError) {
              return Text('Check Your Internet Connectivity!');
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
