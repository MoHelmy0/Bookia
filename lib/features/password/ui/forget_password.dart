import 'package:booksotre/core/routes/routes.dart';
import 'package:booksotre/core/widgets/app_button.dart';
import 'package:booksotre/core/widgets/text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Don't worry! It occurs. Please enter the email address linked with your account.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF9E9E9E),
                  ),
                ),
                SizedBox(height: 32.h),
                TextForm(hint: "Enter your email", pass: null,keyType: TextInputType.emailAddress,),
                SizedBox(height: 24.h),
                AppButton(title: "Send Code", onTap: (){
                  Navigator.pushNamed(context, Routes.otpscreen );
                },) ,
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Remember Password? ",
                      style: TextStyle(
                        color: const Color(0xFF9E9E9E),
                        fontSize: 14.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.loginScreen);
                      },
                      child: Text(
                        'Login',
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