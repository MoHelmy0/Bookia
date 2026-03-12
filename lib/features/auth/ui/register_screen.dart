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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 11.h),
                        BackButton(),
                        SizedBox(height: 29.h),
                  
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Hello! Register to get started",
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 32.h),

                        TextForm(
                          hint: "Username",
                          pass: null,
                          keyType: TextInputType.name,
                        ),

                        TextForm(
                          hint: "Email",
                          pass: null,
                          keyType: TextInputType.emailAddress,
                        ),

                        TextForm(
                          hint: "Password",
                          pass: null,
                          keyType: TextInputType.visiblePassword,
                        ),

                        TextForm(
                          hint: "Confirm password",
                          pass: null,
                          keyType: TextInputType.visiblePassword,
                        ),

                        SizedBox(height: 30.h,),

                        AppButton(title: "Register"),

                        SizedBox(height: 50.h,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.loginScreen);
                              },
                              child: Text(
                                'Login Now',
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