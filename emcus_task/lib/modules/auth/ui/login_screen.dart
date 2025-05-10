import 'package:emcus_task/core/constants/colors.dart';
import 'package:emcus_task/core/constants/images.dart';
import 'package:emcus_task/core/constants/styles.dart';
import 'package:emcus_task/modules/auth/bloc/auth_bloc.dart';
import 'package:emcus_task/modules/common/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.secondaryColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            Snack.pop(context, state.error);
          }

          if (state is AuthSuccess) {
            context.go('/home');
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(child: SizedBox(child: Image.asset(logo))),
                  SizedBox(height: deviceheight / 6),
                  Container(
                    height: deviceheight / 1.50,
                    width: deviceWidth - 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.whiteColor,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        spacing: deviceheight / 64,
                        children: [
                          Text("Sign In", style: kLabelBoldStyle),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Email Address",
                              style: kMediumBoldStyle,
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: deviceheight / 14,
                              maxWidth: deviceWidth - 60,
                            ),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.greyColor,
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.greyColor,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),

                                hintText: "Enter your email address",
                                hintStyle: kSmallStyle,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.greyColor,
                                  ),

                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                                    ).hasMatch(value)) {
                                  return "Enter valid email";
                                }
                                return null;
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Password", style: kMediumBoldStyle),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: deviceheight / 14,
                              maxWidth: deviceWidth - 60,
                            ),
                            child: TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.greyColor,
                                  ),
                                ),

                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.greyColor,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                hintText: "Enter your password",
                                hintStyle: kSmallStyle,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.greyColor,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter valid password";
                                }
                                return null;
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = !rememberMe;
                                  });
                                },
                              ),
                              Text("Remember Me", style: kMediumBoldStyle),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Forgot Password?",
                              style: kMediumBoldStyleRed,
                            ),
                          ),
                          Flexible(
                            child: ElevatedButton(
                              onPressed: () {
                                final isValid = _formKey.currentState!.validate();
                                if (isValid) {
                                  _formKey.currentState!.save();
                                  context.read<AuthBloc>().add(
                                    LoginEvent(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      rememberMe: rememberMe,
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                              ),
                              child:
                                  (state is AuthLoading)
                                      ? CircularProgressIndicator(
                                        color: AppColors.whiteColor,
                                        strokeWidth: 2,
                                      )
                                      : Text("Sign In", style: kSmallStyleWhite),
                            ),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: kMediumBoldStyle,
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.push('/register');
                                  },
                                  child: Text(
                                    "Sign up here",
                                    style: kMediumBoldStyleRed,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
