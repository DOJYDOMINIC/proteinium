import 'package:flutter/cupertino.dart';

import '../../controllers/proteinium_provider.dart';
import 'buildCategoryCard.dart';
import 'buildMealPlans.dart';

Widget buildMealCategoriesList(data, ProteiniumProvider provider) {
  return Expanded(
    child: ListView.builder(
      itemCount: data.data.mealCategories.length,
      itemBuilder: (context, index) {
        final category = data.data.mealCategories[index];
        final isExpanded = provider.isExpanded(index);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  provider.toggleExpanded(index);
                },
                child: buildCategoryCard(category, isExpanded, index, provider),
              ),
              if (isExpanded) buildMealPlans(category),
            ],
          ),
        );
      },
    ),
  );
}
