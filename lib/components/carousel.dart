import 'package:flutter/material.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';

Widget carousel(BuildContext context) {
  return SizedBox(
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: Carousel(
        dotBgColor: Colors.transparent,
        dotPosition: DotPosition.bottomLeft,
        dotSize: 5,
        images: [
          Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbzhahkqZEXcGj9vcOM9kx4-yOtMgt9u7kfA&usqp=CAU',
              fit: BoxFit.cover),
          Image.network(
              'https://www.elegantthemes.com/blog/wp-content/uploads/2020/02/000-Online-Code-Editors.png',
              fit: BoxFit.cover),
          Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwy9jn0n5--QIO8d2ASPKwkby4D0zdCHAeiA&usqp=CAU',
              fit: BoxFit.cover),
        ],
      ));
}
