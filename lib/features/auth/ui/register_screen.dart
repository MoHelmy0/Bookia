import 'package:booksotre/core/routes/routes.dart';
import 'package:booksotre/core/widgets/app_button.dart';
import 'package:booksotre/core/widgets/text_form.dart';
import 'package:booksotre/features/auth/widgets/signin_with_g_a.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 11.h),
                const BackButton(),
                SizedBox(height: 29.h),
                Text(
                  "Hello! Register to get started",
                  style: TextStyle(

                    fontSize: 30.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 32.h),
                TextForm(hint: "Username", pass: null, KeyType: TextInputType.text,),
                TextForm(hint: "Email", pass: null, KeyType: TextInputType.emailAddress,),
                TextForm(hint: "Password", pass: const Icon(Icons.remove_red_eye_rounded), KeyType: TextInputType.visiblePassword,),
                TextForm(hint: "Confirm password", pass: const Icon(Icons.remove_red_eye_rounded), KeyType: TextInputType.visiblePassword,),
  
                  AppButton(title: "Register"),
                  
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: const Color(0xFF9E9E9E), fontSize: 14.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Login Screen
                      },
                      child: AppButton(title: 'Register', onTap: (){ Navigator.pushNamed(context, Routes.loginScreen);})
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}