import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controllers/proteinium_provider.dart';

Widget buildCategoryCard(category, bool isExpanded, int index, ProteiniumProvider provider) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    clipBehavior: Clip.antiAlias,
    child: Stack(
      children: [
        Image.network(
          category.image,
          height: 120,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
           bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.3),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            category.name,
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          bottom: 4,
          right: 8,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
            child: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: Colors.teal.shade300,
            ),
          ),
        ),
      ],
    ),
  );
}