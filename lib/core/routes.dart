import 'package:flutter/material.dart';
import '../pages/auth/login_page.dart';
import '../pages/auth/register_page.dart';
import '../pages/auth/welcome_page.dart';
import '../pages/dashboard/dashboard_page.dart';
import '../pages/catatan/catatan_page.dart'; 

class AppRoutes {
  static const String welcome = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String catatan = "/catatan";
  static const String dashboard = "/dashboard";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomePage());

      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());

      case catatan:
        return MaterialPageRoute(builder: (_) => const CatatanPage());

      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());

      default:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
    }
  }
}