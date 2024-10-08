import 'package:flutter/material.dart';
import 'package:mvvm_sept/resource/components/round_button.dart';
import 'package:mvvm_sept/resource/extension/num_ext.dart';
import 'package:mvvm_sept/utils/routes/routes_name.dart';
import 'package:mvvm_sept/view_model/auth_view_model_controller.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier _obsecureText = ValueNotifier<bool>(true);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModelController =
        Provider.of<AuthViewModelController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Login Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            focusNode: emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              hintText: "Email",
              labelText: "Email",
            ),
            onFieldSubmitted: (value) {
              Utils.fieldFocusChange(
                  context, emailFocusNode, passwordFocusNode);
            },
          ),
          (MediaQuery.sizeOf(context).width * .07).heightBox,
          ValueListenableBuilder(
            valueListenable: _obsecureText,
            builder: (context, value, child) {
              return TextFormField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                obscureText: _obsecureText.value,
                obscuringCharacter: "*",
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _obsecureText.value = !_obsecureText.value;
                    },
                    child: Icon(_obsecureText.value
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  hintText: "Password",
                  labelText: "Password",
                ),
                // onFieldSubmitted: (value) {
                //   Utils.fieldFocusChange(
                //       context, emailFocusNode, passwordFocusNode);
                // },
              );
            },
          ),
          20.heightBox,
          RoundButton(
            title: "login",
            loading: authViewModelController.loginLoading,
            onPress: () {
              if (emailController.text.isEmpty) {
                Utils.showFlushBarErrorMessage("please enter email", context);
              } else if (passwordController.text.isEmpty) {
                Utils.showFlushBarErrorMessage(
                    "please enter password", context);
              } else if (passwordController.text.length < 6) {
                Utils.showFlushBarErrorMessage(
                    "please enter 6 digit password", context);
              } else {
                debugPrint("api  hitt");
                Map data = {
                  'email': emailController.text.toString(),
                  'password': passwordController.text.toString()
                };

                authViewModelController.loginApi(data, context);
              }
            },
          ),
          (MediaQuery.of(context).size.height * 0.001).heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have account?"),
              TextButton(
                  onPressed: () {
                    debugPrint(
                        (MediaQuery.of(context).size.height * 0.1).toString());
                    Navigator.pushNamed(context, RoutesName.signup);
                  },
                  child: const Text("Signup"))
            ],
          )
        ],
      ),
    );
  }
}
