import 'package:booksotre/core/routes/routes.dart';
import 'package:booksotre/core/widgets/app_button.dart';
import 'package:booksotre/core/widgets/text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/signin_with_g_a.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 11.h),
                BackButton(),
                SizedBox(height: 29.h),

                /// Title
                Text(
                  "Welcome back! Glad to see you, Again!",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 32.h),

                /// Email field
                TextForm(
                  hint: "Enter your email",
                  pass: null,
                  keyType: TextInputType.emailAddress,
                ),

                /// Password field
                TextForm(
                  hint: "Enter your password",
                  keyType: TextInputType.visiblePassword,
                  pass: const Icon(Icons.remove_red_eye_rounded),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.forgetpassword);
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ),

                /// Login button
                AppButton(
                  title: "Login",
                  onTap: () {
                    // TODO: Add login logic
                  },
                ),
                SizedBox(height: 34.h),

                /// Divider with "Or"
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: const Color(0xFFE0E0E0), thickness: 1),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'Or',
                        style: TextStyle(
                          color: const Color(0xFF9E9E9E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: const Color(0xFFE0E0E0), thickness: 1),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                /// Google login
                LoginGA(
                  imagePath: "assets/images/google.png",
                  title: "Sign in with Google",
                ),
                SizedBox(height: 20.h),

                /// Register link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: const Color(0xFF9E9E9E),
                        fontSize: 14.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.registerScreen);
                      },
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                          color: const Color(0xFFC9A84C),
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
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
