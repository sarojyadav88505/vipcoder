import 'package:flutter/material.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart';

Gradient g1 = LinearGradient(
  colors: [
    Color(0xFF7F00FF),
    Color(0xFFE100FF),
  ],
);

Widget loadingEffect() {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GradientCircularProgressIndicator(
          valueGradient: g1,
          // value: 0.8,
          backgroundColor: Colors.grey[200],
        ),
      ],
    ),
  );
}
