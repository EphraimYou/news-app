import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/routes/app_routes.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_strings.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController? searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      autofocus: true,
                      onSubmitted:
                          (value) => Navigator.of(context).pushNamed(
                            AppRoutesName.searchResult,
                            arguments: value,
                          ),
                      decoration: InputDecoration(
                        fillColor: AppColors.primaryColor,
                        filled: true,
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          onPressed: () {
                            searchController?.clear();
                          },
                          icon: Icon(Icons.cancel, color: AppColors.iconColor),
                        ),
                        enabledBorder: borderWidget(),
                        disabledBorder: borderWidget(
                          color: AppColors.iconColor,
                        ),

                        errorBorder: borderWidget(color: Colors.red),
                        focusedBorder: borderWidget(),
                        labelText: AppStrings.search,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(AppStrings.cancel),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder borderWidget({Color color = AppColors.blueColor}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: color, width: 1.w),
  );
}
