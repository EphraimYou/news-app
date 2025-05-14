import 'package:news_app/core/api/api_endpoint.dart';
import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/core/error/exception.dart';
import 'package:news_app/core/utils/app_constants.dart';
import 'package:news_app/feature/home/data/data_source/remote/remote_data_source.dart';
import 'package:news_app/feature/home/data/model/top_headline_model.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<TopHeadlineModel> getTopHeadlines() async {
    try {
      final response = await ApiManager.getData(
        endpoint: ApiEndPoint.topHeadlines,
        query: {'apiKey': AppConstants.apiKey, 'country': 'us'},
      );
      if (response.statusCode == 200) {
        // log(response.data.toString());
        final model = TopHeadlineModel.fromJson(response.data);
        return model;
      } else {
        throw ServerException(response.statusMessage.toString());
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
