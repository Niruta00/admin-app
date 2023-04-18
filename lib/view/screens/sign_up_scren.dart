import 'package:admin_app/res/components/round_buttom.dart';
import 'package:admin_app/utils/routes/routes_name.dart';
import 'package:admin_app/utils/routes/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/auth_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _obscureConfirmPassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _createAtController = TextEditingController();

  


  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  FocusNode userNameFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode middleNameFocusNode = FocusNode();

  FocusNode lastNameFocusNode = FocusNode();


  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  FocusNode createdAtFocusNode = FocusNode();

  

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
    print("SignUpPage");
    double height = MediaQuery.of(context).size.height;

    AuthViewModel authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
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
              focusNode: userNameFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "Enter Username",
                  labelText: "Username",
                  prefixIcon: Icon(Icons.email)),
              controller: _userNameController,
              onFieldSubmitted: (value) {
                Utils.fieldFocusChnage(
                  context,
                  userNameFocusNode,
                  emailFocusNode,
                );
              },
            ),
            TextFormField(
              focusNode: firstNameFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "Enter firstname",
                  labelText: "firstName",
                  prefixIcon: Icon(Icons.email)),
              controller: _firstNameController,
              onFieldSubmitted: (value) {
                Utils.fieldFocusChnage(
                  context,
                  firstNameFocusNode,
                  emailFocusNode,
                );
              },
            ),
            TextFormField(
              focusNode: middleNameFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "Enter middlename",
                  labelText: "middleName",
                  prefixIcon: Icon(Icons.email)),
              controller: _middleNameController,
              onFieldSubmitted: (value) {
                Utils.fieldFocusChnage(
                  context,
                  middleNameFocusNode,
                  emailFocusNode,
                );
              },
            ),
            TextFormField(
              focusNode: lastNameFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "Enter lastname",
                  labelText: "lastName",
                  prefixIcon: Icon(Icons.email)),
              controller: _lastNameController,
              onFieldSubmitted: (value) {
                Utils.fieldFocusChnage(
                  context,
                  lastNameFocusNode,
                  emailFocusNode,
                );
              },
            ),
            TextFormField(
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "Enter email",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email)),
              controller: _emailController,
              onFieldSubmitted: (value) {
                Utils.fieldFocusChnage(
                    context, emailFocusNode, passwordFocusNode);
              },
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
            ValueListenableBuilder<bool>(
                valueListenable: _obscureConfirmPassword,
                builder: (context, value, child) {
                  return TextFormField(
                    focusNode: confirmPasswordFocusNode,
                    decoration: InputDecoration(
                        hintText: "Enter your password again",
                        labelText: "Confirm Password",
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffixIcon: InkWell(
                          onTap: () {
                            _obscureConfirmPassword.value =
                                !_obscureConfirmPassword.value;
                          },
                          child: Icon(
                            _obscureConfirmPassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        )),
                    controller: _confirmPasswordController,
                    obscureText: _obscurePassword.value,
                  );
                }),
            SizedBox(
              height: height * .01,
            ),
            RoundButton(
              title: "Sign Up",
              loading: authViewModel.signUpLoading,
              onPressed: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage("Email Cannot be empty", context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      "Password Cannot be empty", context);
                } else if (_passwordController.text.length < 5) {
                  Utils.flushBarErrorMessage(
                      "Password must be at least 6 characters", context);
                } else if (_passwordController.text !=
                    _confirmPasswordController.text) {
                  Utils.flushBarErrorMessage(
                      "Password and confirm password must be same", context);
                } else {
                  Map data = {
                    "username": _userNameController.text.toString(),
                    "first_name":_firstNameController.text.toString(),
                    "middle_name":_middleNameController.text.toString(),

                    "last_name":_lastNameController.text.toString(),
                    "password": _passwordController.text.toString(),
                    "email": _emailController.text.toString(),




                  };
                  // authViewModel.logInApi(data, context);

                  authViewModel.signUpApi(data, context);
                }
              },
            ),
            SizedBox(
              height: height * .1,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text("Already have an account? login"))
          ],
        ),
      ),
    );
  }
}
