import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:vipcoder/const/const.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

Widget testimonialBox(BuildContext context, String name, String status,
    String description, String image) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    color: textColor,
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "$status",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: primaryColor),
                  ),
                  Html(data: '$description'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 5, 50),
              child: Center(
                child: WidgetCircularAnimator(
                  innerColor: primaryColor,
                  outerColor: primaryColor,
                  outerIconsSize: 3,
                  innerIconsSize: 3,
                  size: 130,
                  child: Container(
                    child: CircleAvatar(
                      // radius: 75,
                      backgroundImage: NetworkImage(
                        '$image',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
