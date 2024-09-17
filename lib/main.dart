import 'package:flutter/material.dart';
import 'package:mvvm_sept/utils/routes/routes.dart';
import 'package:mvvm_sept/utils/routes/routes_name.dart';
import 'package:mvvm_sept/view_model/auth_view_model_controller.dart';
import 'package:mvvm_sept/view_model/home_view_model_controller.dart';
import 'package:mvvm_sept/view_model/student_view_model_controller.dart';
import 'package:mvvm_sept/view_model/user_view_model_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModelController()),
        ChangeNotifierProvider(create: (_) => UserViewModelController()),
        // ChangeNotifierProvider(create: (_) => HomeViewModelController()),
        // ChangeNotifierProvider(create: (_) => StudentViewModelController()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),

      ],
      child: MaterialApp(
        title: 'mvvm_sept',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),

        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
