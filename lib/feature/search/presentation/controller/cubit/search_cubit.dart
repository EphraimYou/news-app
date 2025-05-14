import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/error/exception.dart';
import 'package:news_app/feature/home/data/model/top_headline_model.dart';
import 'package:news_app/feature/search/data/data_source/remote/remote_data_source_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchDataSourceImpl searchDataSource;
  SearchCubit({required this.searchDataSource}) : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  TopHeadlineModel? searchResultModel;
  Future<void> getSearchResult({required String query}) async {
    emit(LoadingSearchState());
    try {
      final result = await searchDataSource.searchResult(query: query);
      searchResultModel = result;
      emit(LoadedSearchState());
    } catch (e) {
      emit(ErrorSearchState(message: e.toString()));
      throw ServerException(e.toString());
    }
  }
}
