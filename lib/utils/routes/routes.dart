import 'package:flutter/material.dart';
import 'package:mvvm_sept/utils/routes/routes_name.dart';
import 'package:mvvm_sept/view/home_screen.dart';
import 'package:mvvm_sept/view/login_screen.dart';
import 'package:mvvm_sept/view/signup_screen.dart';
import 'package:mvvm_sept/view/splash_screen.dart';
import 'package:mvvm_sept/view/student_data_screen.dart';
import 'package:mvvm_sept/view/student_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    // final argmt = setting.arguments;
    switch (setting.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => const SignupScreen());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.student:
        return MaterialPageRoute(builder: (context) => const StudentScreen());
      case RoutesName.studentdata:
        return MaterialPageRoute(
            builder: (context) => const StudentDataScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                    body: Center(
                  child: Text("no routes define"),
                )));
    }
  }
}
