import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_style.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  const CategoryButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.w),
      child: MaterialButton(
        onPressed: onTap,

        height: 32.h,
        color: isSelected ? AppColors.primaryColor : Colors.white,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(56.r),
          side: BorderSide(color: AppColors.primaryColor, width: 1.w),
        ),
        child: Text(
          title,
          style: AppStyle.black600w18.copyWith(fontSize: 14.sp),
        ),
      ),
    );
  }
}
