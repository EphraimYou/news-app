import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_strings.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/feature/home/presentation/widgets/category_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 68.h,
        automaticallyImplyLeading: false,
        title: Text(AppStrings.explore, style: AppStyle.titleStyle),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 75.h,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CategoryButton(),
              itemCount: 6,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 206.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.home),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                ),
                Text(
                  AppStrings.sliderTitle,
                  style: AppStyle.black600w18.copyWith(fontSize: 16.sp),
                ),
                Text(AppStrings.subtitle, style: AppStyle.gray400w12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
