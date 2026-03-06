
import 'package:booksotre/core/routes/routes.dart';
import 'package:booksotre/features/auth/ui/login_screen.dart';
import 'package:booksotre/features/auth/ui/register_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {

  Route? onGenerateRoute(RouteSettings settings) {

    switch(settings.name){
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_)=>LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_)=>RegisterScreen());

      default:
        return null;
    }

  }

}