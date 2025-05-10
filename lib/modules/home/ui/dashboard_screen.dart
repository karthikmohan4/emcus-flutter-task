import 'package:emcus_task/core/constants/colors.dart';
import 'package:emcus_task/core/constants/images.dart';
import 'package:emcus_task/core/constants/styles.dart';
import 'package:emcus_task/modules/shared/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        children: [
          AppHeader(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(deviceWidth/20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                    colors: [AppColors.gradient1, AppColors.gradient2],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("SIGNAL STRENGTH", style: kBoldStyleWhite),
                    Text("95%", style: kMediumStyleWhite),
                    Container(
                      width: deviceWidth / 2.7,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("GOOD", style: kBoldStyleGreen),
                          Icon(
                            Icons.task_alt,
                            color: AppColors.green,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(signal),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
