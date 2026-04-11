
import 'package:booksotre/core/routes/routes.dart';
import 'package:booksotre/features/auth/ui/login_screen.dart';
import 'package:booksotre/features/auth/ui/register_screen.dart';
import 'package:booksotre/features/bottom_nav_bar/ui/bottom_nav_bar.dart';
import 'package:booksotre/features/password/ui/create_new_password.dart';
import 'package:booksotre/features/password/ui/forget_password.dart';
import 'package:booksotre/features/password/ui/otp.dart';
import 'package:booksotre/features/password/ui/password_changed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksotre/features/auth/cubit/auth_cubit.dart';

class AppRouter {

  Route? onGenerateRoute(RouteSettings settings) {

    switch(settings.name){
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_)=>BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginScreen(),
        ));
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_)=>BlocProvider(
          create: (context) => AuthCubit(),
          child: const RegisterScreen(),
        ));
      case Routes.forgetpassword:
        return MaterialPageRoute(builder:(_)=>ForgetPassword());
      case Routes.otpscreen:
        return MaterialPageRoute(builder: (_)=>OTPScreen());
      case  Routes.cnp:
        return MaterialPageRoute(builder: (_)=>CreateNewPassword());
      case Routes.passwordchanged:
        return MaterialPageRoute(builder: (_)=>PasswordChanged());
      case Routes.bottomnav :
        return MaterialPageRoute(builder: (_)=>BottomNavBarScreen());
      default:
        return null;
    }

  }

}