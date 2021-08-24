import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipcoder/api/api.dart';
import 'package:vipcoder/components/loading_effect.dart';
import 'package:vipcoder/components/testimonial-Box.dart';
import 'package:vipcoder/components/title.dart';
import 'package:vipcoder/pages/All-Testimonial.dart';

Future getTestimonial() async {
  var response = await Api().getData('testimonial');
  var data = json.decode(response.body)['data'];
  return data;
  // print(data);
}

Widget testimonial(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AllTestimonials()));
          },
          child: title('Testimonial'),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: FutureBuilder(
              future: getTestimonial(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data == null
                      ? Center(
                          child: loadingEffect(),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            var mydata = snapshot.data[index];
                            return testimonialBox(
                              context,
                              mydata['name'],
                              mydata['status'],
                              mydata['description'],
                              mydata['image'],
                            );
                          },
                        );
                } else if (snapshot.hasError) {
                  return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Text('Check Your Internet Connectivity!!!'));
                } else {
                  return loadingEffect();
                }
              },
            )),
      ],
    ),
  );
}
