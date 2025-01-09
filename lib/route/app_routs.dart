import 'package:flutter/material.dart';

import '../screens/home_page.dart';

class AppRoutes {
  static const String homePage = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      // Login Page
      case homePage:
        builder = (context) => HomePage();
        break;
      default:
        builder =
            (context) => const ErrorPage();
    }
    return MaterialPageRoute(
      builder: (context) => builder(context),
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '404 - Page Not Found',
        ),
      ),
    );
  }
}
