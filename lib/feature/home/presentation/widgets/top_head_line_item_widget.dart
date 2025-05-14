// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_style.dart';

class TopHeadLineItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String author;

  const TopHeadLineItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 206.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 16.h, bottom: 4.h),
            child: Text(title, style: AppStyle.black600w18),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  author,
                  style: AppStyle.gray400w12.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                  // overflow: TextOverflow.fade,
                ),
              ),
              Text(date, style: AppStyle.gray400w12),
            ],
          ),
        ],
      ),
    );
  }
}
