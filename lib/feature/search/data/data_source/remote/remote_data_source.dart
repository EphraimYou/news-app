import 'package:news_app/feature/home/data/model/top_headline_model.dart';

abstract class SearchDataSource {
  Future<TopHeadlineModel> searchResult({required String query});
}
