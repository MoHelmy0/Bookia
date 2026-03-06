import 'package:booksotre/core/widgets/app_button.dart';
import 'package:booksotre/core/widgets/text_form.dart';
import 'package:booksotre/features/auth/widgets/signin_with_g_a.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child:
      SingleChildScrollView(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(height:11.h),
                BackButton(),
                SizedBox(height: 29.h,),
                Text("Welcome back! Glad to see you, Again!",style: TextStyle(fontSize: 30,fontWeight: FontWeight(400))),
                SizedBox(height: 32.h,),
                TextForm(hint: "Enter your email", pass: null,),
                TextForm(hint: "Enter your password", pass:Icon(Icons.remove_red_eye_rounded) ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password?'),
                  ),
                ),
                AppButton(title: "Login"),

                SizedBox(height: 34.h,),
// OR MARK

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xFFE0E0E0),
                        thickness: 1,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Or',
                        style: TextStyle(
                          color: Color(0xFF9E9E9E),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Expanded(
                      child: Divider(
                        color: Color(0xFFE0E0E0),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),

                loginGA(imagePath: "assets/images/google.png", titel: "Sign in with Google"),
                loginGA(imagePath: "assets/images/mac.jpg", titel: "Sign in with Apple"),

                SizedBox(width: 92.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: Color(0xFF9E9E9E),
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Register Screen
                      },
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                          color: Color(0xFFC9A84C),
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      )),

    );
  }
}
