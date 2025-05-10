import 'package:emcus_task/core/constants/colors.dart';
import 'package:emcus_task/core/constants/images.dart';
import 'package:emcus_task/core/constants/styles.dart';
import 'package:emcus_task/modules/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
         if (state is AuthInitial) {
            context.push('/');
          }
      },
      builder: (context, state) {
        return Container(
          height: 80,
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: ListTile(
            leading: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (ctx) => AlertDialog(
                        title: const Text("Logout"),
                        content: const Text("Do you want to logout?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              context.read<AuthBloc>().add(LogoutEvent());
                            },
                            child: Text("Okay", style: kSmallStyleRed),
                          ),
                        ],
                      ),
                );
              },
              icon: Icon(Icons.notes, color: AppColors.whiteColor),
            ),
            title: Image.asset(logo),
            trailing: SizedBox(),
          ),
        );
      },
    );
  }
}
