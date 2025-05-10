import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emcus_task/modules/shared/local_storage/secure_local_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        if (event.email!.isNotEmpty || event.password!.isNotEmpty) {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                email: event.email!,
                password: event.password!,
              );
          if (event.rememberMe!) {
          await   SecureStorage().writeSecureData("isLogged", "true");
          }
          emit(AuthSuccess());
        } else {
          emit(AuthFailure(error: "Wrong email/password"));
        }
      } catch (e) {
        emit(AuthFailure(error: "Wrong email/password"));
      }
    });

    on<RegisterUserEvent>((event, emit) async {
      try {
        final Map<String, String> userData = {
          'name': event.name.toString(),
          'company name': event.companyName.toString(),
        };
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: event.email!,
              password: event.password!,
            );

        if (credential.user!.uid.isNotEmpty) {
          FirebaseFirestore firestore = FirebaseFirestore.instance;
          firestore
              .collection("users")
              .doc(credential.user!.uid)
              .set(userData)
              .then((value) => {print("user added")})
              .catchError((error) => print(error));
        }
        SecureStorage().writeSecureData("isLogged", "true");
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(error: "Registration Failed"));
      }
    });

    on<LogoutEvent>((event, emit) async {
      await FirebaseAuth.instance.signOut();
      SecureStorage().writeSecureData("isLogged", "false");
      emit(AuthInitial());
    });
  }
}
