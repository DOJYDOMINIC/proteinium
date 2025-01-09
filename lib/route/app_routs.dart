import 'package:flutter/material.dart';

import '../screens/home_page.dart';

class AppRoutes {
  static const String onboarding = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      // Login Page
      case onboarding:
        builder = (context) => HomePage();
        break;

      // Default (Error Page)
      default:
        builder =
            (context) => const ErrorPage(); // Fallback for unhandled routes
    }

    return MaterialPageRoute(
      builder: (context) => builder(context),
    );
  }
}

// Error Page Widget
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
