import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/error/exception.dart';
import 'package:news_app/core/utils/app_strings.dart';
import 'package:news_app/feature/home/data/data_source/remote/remote_data_source.dart';
import 'package:news_app/feature/home/data/model/top_headline_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RemoteDataSource remoteDataSource;
  HomeCubit({required this.remoteDataSource}) : super(HomeInitial());
  int? currentIndex;

  static HomeCubit get(context) => BlocProvider.of(context);
  void changeButtonColor(int index) {
    emit(HomeInitial());
    currentIndex = index;
    emit(ChangeButtonColorState());
  }

  TopHeadlineModel? model;
  Future<void> getTopHeadline() async {
    emit(LoadingHomeState());
    try {
      final result = await remoteDataSource.getTopHeadlines();
      model = result;
      emit(SuccessHomeState());
    } catch (e) {
      emit(ErrorHomeState(message: e.toString()));
      throw ServerException(e.toString());
    }
  }

  List<String> searchCategory = [
    AppStrings.business,
    AppStrings.travel,
    AppStrings.technology,
    AppStrings.entertainment,
  ];
}
