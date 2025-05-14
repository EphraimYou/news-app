import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/functions/parse_date.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_strings.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/feature/search/data/data_source/remote/remote_data_source_impl.dart';
import 'package:news_app/feature/search/presentation/controller/cubit/search_cubit.dart';
import 'package:news_app/feature/search/presentation/widgets/article_card_widget.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;
  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.searchResult, style: AppStyle.black600w18),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider(
          create:
              (context) =>
                  SearchCubit(searchDataSource: SearchDataSourceImpl())
                    ..getSearchResult(query: query),
          child: BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              SearchCubit cubit = SearchCubit.get(context);
              final data = cubit.searchResultModel?.articles;
              if (state is LoadingSearchState) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else {
                return cubit.searchResultModel?.articles?.isEmpty ?? true
                    ? const Center(child: Text("No Result Found"))
                    : Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder:
                                (context, index) => ArticleCardWidget(
                                  title: data?[index].title ?? "No Title",
                                  image:
                                      data?[index].urlToImage ??
                                      AppAssets.emptyImage,
                                  author: data?[index].author ?? "No Author",
                                  date: ParseDate.formatDate(
                                    data?[index].publishedAt ?? "No Date",
                                  ),
                                ),
                            separatorBuilder:
                                (context, index) => SizedBox(height: 16.h),
                            itemCount:
                                cubit.searchResultModel?.articles?.length ?? 0,
                          ),
                        ),
                      ],
                    );
              }
            },
          ),
        ),
      ),
    );
  }
}
