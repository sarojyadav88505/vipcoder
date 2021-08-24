import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/blogBox.dart';
import 'package:vipcoder/components/loading_effect.dart';

class AllBlog extends StatefulWidget {
  @override
  _AllBlogState createState() => _AllBlogState();
}

class _AllBlogState extends State<AllBlog> {
  Future getAllBlogs() async {
    var response = await Api().getData('allblog');
    var data = json.decode(response.body)['data'];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: getAllBlogs(),
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
                              mydata['created_at'],
                            );
                          },
                        );
                } else if (snapshot.hasError) {
                  return Text('Check Your Internet Connection!!!');
                } else {
                  return Center(
                    child: loadingEffect(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
