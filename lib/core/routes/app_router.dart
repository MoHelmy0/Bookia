
import 'package:booksotre/features/book_details/ui/book_details_screen.dart';
import 'package:booksotre/features/book_details/cubit/book_details_cubit.dart';
import 'package:booksotre/features/home/data/models/book_model.dart';
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

import 'package:booksotre/features/profile/ui/edit_profile_screen.dart';
import 'package:booksotre/features/profile/ui/update_password_screen.dart';
import 'package:booksotre/features/profile/ui/order_history_screen.dart';
import 'package:booksotre/features/profile/cubit/profile_cubit.dart';
import 'package:booksotre/features/search/ui/search_screen.dart';

class AppRouter {
  final ProfileCubit _profileCubit = ProfileCubit()..fetchProfileData();

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
        return MaterialPageRoute(builder: (_)=>BlocProvider.value(
          value: _profileCubit,
          child: const BottomNavBarScreen(),
        ));
      case Routes.bookDetailsScreen:
        final book = settings.arguments as BookModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => BookDetailsCubit(),
            child: BookDetailsScreen(book: book),
          ),
        );
      case Routes.editProfile:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _profileCubit,
            child: const EditProfileScreen(),
          ),
        );
      case Routes.updatePassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _profileCubit,
            child: const UpdatePasswordScreen(),
          ),
        );
      case Routes.orderHistory:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _profileCubit,
            child: const OrderHistoryScreen(),
          ),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );
      default:
        return null;
    }

  }

}