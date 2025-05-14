import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_style.dart';

class ArticleCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final String author;
  final String date;

  const ArticleCardWidget({
    super.key,
    required this.title,
    required this.image,
    required this.author,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyle.black600w18,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                Row(
                  spacing: 1.w,
                  children: [
                    Expanded(
                      child: Text(
                        author,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.gray400w12,
                      ),
                    ),
                    Text(date, style: AppStyle.gray400w12),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 5.w),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            child: Image(
              image: CachedNetworkImageProvider(image),
              height: 80.h,
              width: 112.w,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
