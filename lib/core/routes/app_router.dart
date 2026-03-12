
import 'package:booksotre/core/routes/routes.dart';
import 'package:booksotre/features/auth/ui/login_screen.dart';
import 'package:booksotre/features/auth/ui/register_screen.dart';
import 'package:booksotre/features/password/ui/create_new_password.dart';
import 'package:booksotre/features/password/ui/forget_password.dart';
import 'package:booksotre/features/password/ui/otp.dart';
import 'package:booksotre/features/password/ui/password_changed.dart';
import 'package:flutter/material.dart';

class AppRouter {

  Route? onGenerateRoute(RouteSettings settings) {

    switch(settings.name){
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_)=>LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_)=>RegisterScreen());
      case Routes.forgetpassword:
        return MaterialPageRoute(builder:(_)=>ForgetPassword());
      case Routes.otpscreen:
        return MaterialPageRoute(builder: (_)=>OTPScreen());
      case  Routes.cnp:
        return MaterialPageRoute(builder: (_)=>CreateNewPassword());
      case Routes.passwordchanged:
        return MaterialPageRoute(builder: (_)=>PasswordChanged());
      default:
        return null;
    }

  }

}