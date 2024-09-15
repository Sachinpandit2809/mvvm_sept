import 'package:flutter/material.dart';
import 'package:mvvm_sept/utils/routes/routes_name.dart';
import 'package:mvvm_sept/view/home_screen.dart';
import 'package:mvvm_sept/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    // final argmt = setting.arguments;
    switch (setting.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                    body: Center(
                  child: Text("no routes define"),
                )));
    }
  }
}
