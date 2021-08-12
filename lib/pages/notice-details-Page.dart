import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class NoticePage extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;
  final String? createdAt;
  NoticePage({this.title, this.description, this.image, this.createdAt});
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
              this.image == null ? SizedBox() : Image.network(this.image!),
              // Title and description
              ListTile(
                title: Text(
                  this.title!,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                subtitle: this.description == null
                    ? SizedBox()
                    : Html(data: this.description!),
              )
            ],
          ),
        ),
      ),
    );
  }
}
