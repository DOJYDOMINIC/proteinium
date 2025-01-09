import 'package:flutter/material.dart';
import 'package:proteinium/screens/widgets/buildBanner.dart';
import 'package:proteinium/screens/widgets/buildBottomNavigationBar.dart';
import 'package:proteinium/screens/widgets/buildMealCategoriesList.dart';
import 'package:provider/provider.dart';
import '../controllers/proteinium_provider.dart';

class ExpandableListScreen extends StatefulWidget {
  const ExpandableListScreen({super.key});

  @override
  State<ExpandableListScreen> createState() => _ExpandableListScreenState();
}

class _ExpandableListScreenState extends State<ExpandableListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProteiniumProvider>(context, listen: false)
        .fetchMealCategories("en");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProteiniumProvider>(
      builder: (context, provider, child) {
        final data = provider.mealCategories;

        if (data == null) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
            bottomNavigationBar: buildBottomNavigationBar(provider),
          );
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildBanner(data.data.banners[0].image),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Center(child: CircleAvatar(radius: 4,backgroundColor: Colors.teal.shade300,)),
                    ),
                    buildMealCategoriesList(data, provider),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: buildBottomNavigationBar(provider),
        );
      },
    );
  }
}
