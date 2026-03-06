import 'package:booksotre/core/theme/app_colors.dart';
import 'package:booksotre/gen/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AppButton extends StatelessWidget {
  final Color? backgroundColor;
  final String title;
  final void Function()? onTap;
  const AppButton({super.key,  this.backgroundColor, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.r),
      color: backgroundColor??AppColors.primaryColor,
      clipBehavior:Clip.antiAlias ,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 19.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border:backgroundColor==null?null :Border.all(
              color: Colors.black
            ),
            borderRadius: BorderRadius.circular(8.r)
          ),
          child: Text(title,style: TextStyle(
            fontSize: 15.sp,
            color:backgroundColor==null?Colors.white:Colors.black
          ),),
        ),
      ),
    );
  }
}
