import 'package:flutter/material.dart';
import 'package:mvvm_sept/utils/routes/routes_name.dart';
import 'package:mvvm_sept/view_model/user_view_model_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModelController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("HomeScreen "),
        actions: [
          IconButton(
              onPressed: () {
                userPreference.removeUser().then((onValue) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
