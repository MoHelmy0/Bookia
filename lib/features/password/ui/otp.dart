import 'package:booksotre/core/routes/routes.dart';
import 'package:booksotre/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),

            BackButton(),

             SizedBox(height: 20.h),

             Text(
              "OTP Verification",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold ),
            ),

             SizedBox(height: 10.h),

             Text(
               "Enter the verification code we just sent on your email address.",style: TextStyle(color: Color(0xFF8391A1)),
            ),

             SizedBox(height: 40.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                6,
                    (index) => SizedBox(
                  width: 45.w,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration:  InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),

             SizedBox(height: 40.h),

              
             AppButton(title: "Verify" ,onTap: (){

               Navigator.pushNamed(context, Routes.cnp);

             },),

            SizedBox(height: 50.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Didn’t received code?  ",
              style: TextStyle(
                color: const Color(0xFF9E9E9E),
                fontSize: 14.sp,
              ),
            ),
            GestureDetector(
              onTap: () {
               Navigator.pushNamed(context, Routes.otpscreen);
              },
              child: Text(
                'Resend',
                style: TextStyle(
                  color: const Color(0xFFC9A84C),
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
            ),



          ],
        ),
          ]
        ),

      ),

    );



  }


}
