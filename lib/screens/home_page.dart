import 'package:flutter/material.dart';
import 'package:proteinium/services/api_call.dart';
import 'package:provider/provider.dart';

import '../controllers/proteinium_provider.dart';
import 'expandable_listScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    Provider.of<ProteiniumProvider>(context, listen: false).fetchMealCategories("en");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        centerTitle: true,
        title: const Text("PROTEINIUM",style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.notifications,color: Colors.white,),
          ),
        ],
      ),

      body:  ExpandableListScreen(),
    );
  }
}

