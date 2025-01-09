import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proteinium/route/app_routs.dart';
import 'package:provider/provider.dart';
import 'controllers/proteinium_provider.dart';


void main() {
  runApp(const Proteinium());
}

class Proteinium extends StatefulWidget {
  const Proteinium({super.key});

  @override
  State<Proteinium> createState() => _ProteiniumState();
}

class _ProteiniumState extends State<Proteinium> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProteiniumProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(402, 874), // Adjust to your design's base size
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.onboarding, // Define the initial route
            onGenerateRoute: AppRoutes.generateRoute, // Set the route generator
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
          );
        },
      ),
    );
  }
}