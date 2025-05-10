import 'package:emcus_task/core/constants/colors.dart';
import 'package:emcus_task/core/constants/images.dart';
import 'package:emcus_task/core/constants/styles.dart';
import 'package:emcus_task/modules/auth/bloc/auth_bloc.dart';
import 'package:emcus_task/modules/common/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final companyNameController = TextEditingController();

  bool isAgreedTerms = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            Snack.pop(context, state.error);
          }
          if (state is AuthSuccess) {
            context.push('/home');
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator(color: AppColors.whiteColor,));
          }

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: SizedBox(
                    height: deviceheight/18,
                    child: Image.asset(logo))),
                  SizedBox(height: deviceheight/30,),
                  Container(
                    height: deviceheight / 0.95,
                    width: deviceWidth - 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.whiteColor,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        spacing: deviceheight / 64,
                        children: [
                          Text("Register", style: kLabelBoldStyle),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Name", style: kMediumBoldStyle),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: deviceheight / 14,
                              maxWidth: deviceWidth - 60,
                            ),
                            child: TextFormField(
                              controller: nameController,
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

                                hintText: "Enter your name",
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
                                  return "Enter valid name";
                                }
                                return null;
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Company Name",
                              style: kMediumBoldStyle,
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: deviceheight / 14,
                              maxWidth: deviceWidth - 60,
                            ),
                            child: TextFormField(
                              controller: companyNameController,
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

                                hintText: "Enter your company name",
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
                                  return "Enter valid company name";
                                }
                                return null;
                              },
                            ),
                          ),
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
                                } else if(value.isNotEmpty && value.length<6){
                               return "Password should be alteast 6 characters";
                                }
                                return null;
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Confirm Password",
                              style: kMediumBoldStyle,
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: deviceheight / 14,
                              maxWidth: deviceWidth - 60,
                            ),
                            child: TextFormField(
                              controller: confirmPasswordController,
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
                                if (value!.isEmpty ||
                                    (value.toString() !=
                                        passwordController.text)) {
                                  return "Password aren't matching";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: deviceheight / 13,
                            width: deviceWidth - 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: isAgreedTerms,
                                  onChanged: (value) {
                                    setState(() {
                                      isAgreedTerms = !isAgreedTerms;
                                    });
                                  },
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          "By signing with you agreeing with FFE",
                                          style: kSmallStyle,
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          "Terms & condition and Privacy Policy",
                                          style: kSmallStyleRed,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context.pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.lightGreyColor,
                                ),
                                child: Text("Cancel", style: kSmallStyle),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final isValid =
                                      _formKey.currentState!.validate();
                                  if (isValid) {
                                    _formKey.currentState!.save();
                                    if (isAgreedTerms) {
                                      context.read<AuthBloc>().add(
                                        RegisterUserEvent(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          name: nameController.text,
                                          confirmPassword:
                                              confirmPasswordController.text,
                                          companyName:
                                              companyNameController.text,
                                          isAgreedTerms: isAgreedTerms,
                                        ),
                                      );
                                    } else {
                                      Snack.pop(
                                        context,
                                        "Please accept terms and conditions",
                                      );
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                ),
                                child: Text("Sign In", style: kSmallStyleWhite),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: kMediumBoldStyle,
                              ),
                              TextButton(
                                onPressed: () {
                                 context.pop();
                                },
                                child: Text(
                                  "Sign in here",
                                  style: kMediumBoldStyleRed,
                                ),
                              ),
                            ],
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
