import 'package:flutter/material.dart';
import 'package:vipcoder/const/const.dart';
import 'package:vipcoder/pages/blogPage.dart';

Widget blogBox(BuildContext context, String title, String description,
    String image, String createdat) {
  return Card(
    color: textColor,
    child: ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogPage(
              title: title, //constructor
              description: description,
              image: image,
            ),
          ),
        );
      },
      leading: Container(
        child: Image.network(
          '$image',
          fit: BoxFit.cover,
        ),
      ),
      title: Text('$title'),
      subtitle: Text('$createdat'),
      trailing: Icon(
        Icons.arrow_right,
        size: 30,
      ),
    ),
  );
}
