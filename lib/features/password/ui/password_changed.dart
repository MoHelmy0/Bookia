import 'package:booksotre/core/routes/routes.dart';
import 'package:booksotre/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // الصورة اللي في النص
              Image.asset(
                "assets/images/—Pngtree—green check mark icon flat_5253210.png",
                width: 120,
                height: 120,
              ),

               SizedBox(height: 30),

               Text(
                "Password Changed!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

               SizedBox(height: 10),

               Text(
                "Your password has been changed successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

               SizedBox(height: 40),

              AppButton(title: "Back To Login" , onTap: (){

                Navigator.pushNamed(context, Routes.loginScreen);

              },)


            ],
          ),
        ),
      ),
    );
  }
}