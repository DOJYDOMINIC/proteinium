import 'package:flutter/cupertino.dart';

Widget buildBanner(String imageUrl) {
  return Container(
    height: 180,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(imageUrl),
        fit: BoxFit.cover,
      ),
    ),
  );
}