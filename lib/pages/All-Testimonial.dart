import 'package:flutter/material.dart';
import 'package:vipcoder/components/loading_effect.dart';
import 'package:vipcoder/components/testimonial-Box.dart';
import 'package:vipcoder/components/testimonial.dart';

class AllTestimonials extends StatefulWidget {
  @override
  _AllTestimonialsState createState() => _AllTestimonialsState();
}

class _AllTestimonialsState extends State<AllTestimonials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testimonials'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: getTestimonial(),
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
                    child: Image.asset('assets/cry.gif'),
                  );
                } else {
                  return loadingEffect();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
