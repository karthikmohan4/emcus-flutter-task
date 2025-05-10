import 'package:emcus_task/core/constants/colors.dart';
import 'package:emcus_task/core/constants/styles.dart';
import 'package:emcus_task/modules/shared/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class DiagnosticsScreen extends StatelessWidget {
  const DiagnosticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        children: [
          AppHeader(),
          Expanded(
            child: Center(
              child: Text("Diagnostics",style: kMediumBoldStyleWhite,),
            ),
          ),
        ],
      ),
    );
  }
}