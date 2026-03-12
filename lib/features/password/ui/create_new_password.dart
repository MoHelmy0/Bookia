import 'package:booksotre/core/routes/routes.dart';
import 'package:booksotre/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/text_form.dart' show TextForm;

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:20.h,),
                BackButton(),
                SizedBox(height: 20.h,),
                Text("Create new password",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30.sp),),
                SizedBox(height: 10.h,),
                
                Text("Your new password must be unique from those previously used." ,style:TextStyle(color: Color(0xff8391A1)) ,),

                TextForm(hint: "New Password", keyType: TextInputType.visiblePassword),
                TextForm(hint: "Confirm Password", keyType: TextInputType.visiblePassword),

                SizedBox(height:  10.h),

                AppButton(title: "Reset Password" ,onTap: (){
                  Navigator.pushNamed(context, Routes.passwordchanged);
                },),


              ],
            ),
          )),
        
      
    );
  }
}
