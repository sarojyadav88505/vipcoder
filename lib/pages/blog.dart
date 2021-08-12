import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class BlogPage extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;
  final String? createdAt;
  BlogPage({this.title, this.description, this.image, this.createdAt});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title!),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // image
              Image.network(this.image!),
              // Title and description
              ListTile(
                title: Text(
                  this.title!,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                subtitle: Html(data: this.description!),
              )
            ],
          ),
        ),
      ),
    );
  }
}
