import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildMealPlans(category) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6, spreadRadius: 2)],
    ),
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(  // Add scrolling for meal plans
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: category.mealPlans?.asMap().entries.map<Widget>((entry) {
          final mealPlan = entry.value;
          final isLastItem = entry.key == category.mealPlans!.length - 1;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.room_service_outlined, color: Colors.red.shade300, size: 30),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(mealPlan.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(mealPlan.shortDescription, style: TextStyle(fontSize: 12, color: Colors.teal.shade300)),
                    ],
                  ),
                ],
              ),
              if (!isLastItem)
                Divider(color: Colors.grey, thickness: 1, indent: 0, endIndent: 0),
            ],
          );
        }).toList() ?? [],
      ),
    ),
  );
}
