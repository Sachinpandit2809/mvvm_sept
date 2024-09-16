import 'package:flutter/material.dart';
import 'package:mvvm_sept/models/user_model.dart';
import 'package:mvvm_sept/repository/auth_repository.dart';
import 'package:mvvm_sept/utils/routes/routes_name.dart';
import 'package:mvvm_sept/utils/utils.dart';
import 'package:mvvm_sept/view_model/user_view_model_controller.dart';
import 'package:provider/provider.dart';

class AuthViewModelController with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;
  void setLoginLoading(bool loading) {
    _loginLoading = loading;
    notifyListeners();
  }

  bool _signupLoading = false;
  bool get signupLoading => _signupLoading;
  void setsignupLoading(bool loading) {
    _signupLoading = loading;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoginLoading(true);
    _myRepo.loginApi(data).then((onValue) {
      setLoginLoading(false);
      debugPrint("login token => $onValue");
      final userPreference =
          Provider.of<UserViewModelController>(context, listen: false);
      userPreference.saveUser(UserModel(
        token: onValue['token'].toString(),
      ));
      Utils.toastSuccessMessage("Login Succesfully");
      Navigator.pushNamed(context, RoutesName.home);
    }).onError(
      (error, stackTrace) {
        setLoginLoading(false);

        if (error.toString() ==
            '{"message":"Invalid credentials"}Invalid request') {
          Utils.showFlushBarErrorMessage('password wrong', context);
        }

        debugPrint(error.toString());
      },
    );
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setsignupLoading(true);
    _myRepo.signupApi(data).then((onValue) {
      setsignupLoading(false);
      debugPrint("login token => $onValue");
      final userPreference =
          Provider.of<UserViewModelController>(context, listen: false);
      userPreference.saveUser(UserModel(
        token: onValue['token'].toString(),
      ));
      debugPrint("auth_view_controller_signUPApi$onValue");
      debugPrint("\n$onValue");
      Utils.toastSuccessMessage(onValue['message'].toString());
      Navigator.pushNamed(context, RoutesName.home);
    }).onError(
      (error, stackTrace) {
        setsignupLoading(false);

        if (error.toString() ==
            '{"message":"User already exists"}Invalid request') {
          Utils.showFlushBarErrorMessage(
              'User already exist! please login', context);
        }
        // Utils.showFlushBarErrorMessage(error.toString(), context);

        // ignore: prefer_interpolation_to_compose_strings
        debugPrint("auth_view_controller_signUPApi__Error" + error.toString());
        debugPrint("\n" + error.toString());
      },
    );
  }
}
