import 'package:flutter/material.dart';
import 'package:mvvm_sept/models/user_model.dart';
import 'package:mvvm_sept/utils/routes/routes_name.dart';
import 'package:mvvm_sept/view_model/user_view_model_controller.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModelController().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((onValue) async {
      debugPrint(onValue.token);
      if (onValue.token == "null" || onValue.token == '') {
        await Future.delayed(const Duration(seconds: 4));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(const Duration(seconds: 4));

        Navigator.pushNamed(context, RoutesName.studentdata);
      }
    }).onError(
      (error, stackTrace) {
        debugPrint(error.toString());
      },
    );
  }
}
