import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/routes/app_routes.dart';
import 'package:news_app/core/functions/parse_date.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_strings.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/feature/home/data/data_source/remote/remote_data_source_impl.dart';
import 'package:news_app/feature/home/presentation/controller/cubit/home_cubit.dart';
import 'package:news_app/feature/home/presentation/widgets/category_button.dart';
import 'package:news_app/feature/home/presentation/widgets/top_head_line_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              HomeCubit(remoteDataSource: RemoteDataSourceImpl())
                ..getTopHeadline(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          toolbarHeight: 68.h,
          automaticallyImplyLeading: false,
          title: Text(AppStrings.explore, style: AppStyle.titleStyle),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesName.search);
              },
            ),
          ],
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = HomeCubit.get(context);
            final data = cubit.model?.articles ?? [];
            if (state is LoadingHomeState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: 75.h,
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder:
                          (context, index) => CategoryButton(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRoutesName.searchResult,
                                arguments: cubit.searchCategory[index],
                              );
                              cubit.changeButtonColor(index);
                            },
                            isSelected: cubit.currentIndex == index,
                            title: cubit.searchCategory[index],
                          ),
                      itemCount: cubit.searchCategory.length,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder:
                          (context, index) => TopHeadLineItemWidget(
                            image:
                                data[index].urlToImage ?? AppAssets.emptyImage,
                            title: data[index].title ?? 'not has title',
                            date: ParseDate.formatDate(
                              data[index].publishedAt ?? '00-00-0000',
                            ),
                            author: data[index].author ?? 'no-author',
                          ),
                      separatorBuilder:
                          (context, index) => SizedBox(height: 24.h),
                      itemCount: cubit.model?.articles?.length ?? 0,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
