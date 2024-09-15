import 'package:flutter/material.dart';
import 'package:mvvm_sept/repository/auth_repository.dart';
import 'package:mvvm_sept/utils/utils.dart';

class AuthViewModelController with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;
  void setLoginLoading(bool loading) {
    _loginLoading = loading;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoginLoading(true);
    _myRepo.loginApi(data).then((onValue) {
      setLoginLoading(false);

      debugPrint(onValue.toString());
      Utils.toastSuccessMessage("Login Succesfully");
    }).onError(
      (error, stackTrace) {
        setLoginLoading(false);

        if (error.toString() ==
            '{"message":"Invalid credentials"}Invalid request') {
          Utils.showFlushBarErrorMessage('password wrong', context);
        }
        // Utils.showFlushBarErrorMessage(error.toString(), context);

        debugPrint(error.toString());
      },
    );
  }
}
