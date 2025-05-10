import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_strings.dart';
import 'package:news_app/core/utils/app_style.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.w),
      child: MaterialButton(
        onPressed: () {},
        height: 32.h,
        color: AppColors.primaryColor,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(56.r),
          side: BorderSide(color: AppColors.primaryColor, width: 1.w),
        ),
        child: Text(
          AppStrings.travel,
          style: AppStyle.black600w18.copyWith(fontSize: 14.sp),
        ),
      ),
    );
  }
}
