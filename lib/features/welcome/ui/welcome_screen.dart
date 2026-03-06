import 'package:booksotre/core/routes/routes.dart';
import 'package:booksotre/core/widgets/app_button.dart';
import 'package:booksotre/gen/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        decoration: BoxDecoration(
          image: DecorationImage(image:Assets.images.welcomeBackground.image().image,
          fit: BoxFit.cover
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 30.h,),
            Row(
              children: [
                IconButton(onPressed: (){
                  if(context.locale.languageCode=="ar"){
                    context.setLocale(Locale("en"));
                  }else{
                    context.setLocale(Locale("ar"));

                  }

                }, icon: Icon(Icons.language)),
              ],
            ),

            SizedBox(height: 90.h,),
            Assets.images.splash.image(),
            SizedBox(height: 28.h,),
            Expanded(
              child: Text(LocaleKeys.orderNow.tr(),
              style: TextStyle(
                fontSize: 20.sp
              ),
              ),
            ),

            AppButton(
              title: LocaleKeys.login.tr(),
              onTap: (){
                Navigator.pushNamed(context, Routes.loginScreen);
              },
            ),
            SizedBox(height: 15.h,),
            AppButton(
              title: LocaleKeys.register.tr(),
              backgroundColor:Colors.white,
              onTap: (){
                Navigator.pushNamed(context, Routes.registerScreen);

              },
            ),
            SizedBox(height: 94.h,)

          ],
        ),
      ) ,
    );
  }
}
