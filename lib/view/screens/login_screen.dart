import 'package:admin_app/res/components/round_buttom.dart';
import 'package:admin_app/utils/routes/routes_name.dart';
import 'package:admin_app/utils/routes/utils.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../view_model/auth_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(false);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    final authViewModel = Provider.of<AuthViewModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.login);
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "Enter Username",
                  labelText: "Username",
                  prefixIcon: Icon(Icons.email)),
              controller: _emailController,
              // onFieldSubmitted: (value) {
              //   Utils.fieldFocusChnage(
              //       context, emailFocusNode, passwordFocusNode);
              // },
            ),
            ValueListenableBuilder<bool>(
                valueListenable: _obscurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffixIcon: InkWell(
                          onTap: () {
                            _obscurePassword.value = !_obscurePassword.value;
                          },
                          child: Icon(
                            _obscurePassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        )),
                    controller: _passwordController,
                    obscureText: _obscurePassword.value,
                  );
                }),
            SizedBox(
              height: height * .1,
            ),
            
             RoundButton(
                title: "Login",
                loading: authViewModel.loading,
                onPressed: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        "Email Cannot be empty", context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        "Password Cannot be empty", context);
                  } else if (_passwordController.text.length < 5) {
                    Utils.flushBarErrorMessage(
                        "Password must be at least 6 characters", context);
                  } else {
                    Map data = {
                      "email": _emailController.text.toString(),
                      "password": _passwordController.text.toString()
                    };

                    authViewModel.logInApi(data, context);
                  }
                },
              ),
            
            SizedBox(
              height: height * .1,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.SignUp);
                },
                child: Text("Dont have  an account? signup"))
          ],
        ),
      ),
    );
  }
}
