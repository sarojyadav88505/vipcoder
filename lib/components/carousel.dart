import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/const/const.dart';

Widget carousel(BuildContext context) {
  Future getSlide() async {
    var response = await Api().getData('slide');
    var data = json.decode(response.body);
    return data;
  }

  return FutureBuilder(
    future: getSlide(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return snapshot.data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: 250.0,
              width: MediaQuery.of(context).size.width,
              child: Carousel(
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomLeft,
                dotSize: 5,
                dotSpacing: 10,
                animationDuration: Duration(seconds: 1),
                images: [
                  Image.network(url + snapshot.data[0]['image'],
                      fit: BoxFit.cover),
                  Image.network(url + snapshot.data[1]['image'],
                      fit: BoxFit.cover),
                  Image.network(url + snapshot.data[2]['image'],
                      fit: BoxFit.cover),
                  Image.network(url + snapshot.data[3]['image'],
                      fit: BoxFit.cover),
                  Image.network(url + snapshot.data[4]['image'],
                      fit: BoxFit.cover),
                ],
              ),
            );
    },
  );
}
