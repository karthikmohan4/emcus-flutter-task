import 'dart:async';

import 'package:emcus_task/core/constants/images.dart';
import 'package:emcus_task/modules/shared/local_storage/secure_local_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? isLogged = false;

  @override
  void initState() {
    if(mounted){
checkLoginStatus().whenComplete(() {
      if (isLogged==true) {
        Timer(
          Duration(seconds: 3),
          () => context.go('/home')
        );
      } else {
        Timer(
          Duration(seconds: 3),
          () => context.go('/login') 
        );
      }
       });
    }
    
   

    super.initState();
  }

  Future checkLoginStatus() async {
    final status = await SecureStorage().readSecureData("isLogged");
    if (status == "true") {
      isLogged = true;
    } else {
    isLogged = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Image.asset(
        splashImage,
        fit: BoxFit.fill,
        width: deviceWidth,
        height: deviceheight,
      ),
    );
  }
}
