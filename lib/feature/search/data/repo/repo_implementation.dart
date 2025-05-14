import 'package:news_app/feature/home/data/model/top_headline_model.dart';
import 'package:news_app/feature/search/data/data_source/remote/remote_data_source_impl.dart';

class RepoImplementation {
  final SearchDataSourceImpl searchDataSource;

  RepoImplementation({required this.searchDataSource});

  Future<TopHeadlineModel> searchResult({required String query}) =>
      searchDataSource.searchResult(query: query);
}
