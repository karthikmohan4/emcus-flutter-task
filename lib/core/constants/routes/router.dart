import 'package:emcus_task/modules/auth/ui/login_screen.dart';
import 'package:emcus_task/modules/auth/ui/register_screen.dart';
import 'package:emcus_task/modules/home/ui/home_screen.dart';
import 'package:emcus_task/modules/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
GoRoute(path: '/',
builder: (context, state) => SplashScreen(),
),
GoRoute(path: '/login',
builder: (context, state) => LoginScreen(),
),
GoRoute(path: '/register',
builder: (context, state) => RegisterScreen(),
),
GoRoute(path: '/home',
builder: (context, state) => HomeScreen(),
),
]);