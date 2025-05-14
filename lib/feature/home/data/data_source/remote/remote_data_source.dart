import 'package:news_app/feature/home/data/model/top_headline_model.dart';

abstract class RemoteDataSource {
  Future<TopHeadlineModel> getTopHeadlines();
}
