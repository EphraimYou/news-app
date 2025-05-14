import 'dart:developer';

import 'package:news_app/core/api/api_endpoint.dart';
import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/core/error/exception.dart';
import 'package:news_app/core/utils/app_constants.dart';
import 'package:news_app/feature/home/data/model/top_headline_model.dart';
import 'package:news_app/feature/search/data/data_source/remote/remote_data_source.dart';

class SearchDataSourceImpl implements SearchDataSource {
  @override
  Future<TopHeadlineModel> searchResult({required String query}) async {
    try {
      final response = await ApiManager.getData(
        endpoint: ApiEndPoint.everything,
        query: {'apiKey': AppConstants.apiKey, 'q': query},
      );
      if (response.statusCode == 200) {
        log(response.data.toString());
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
