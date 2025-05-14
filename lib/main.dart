import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/routes/app_routes.dart';
import 'package:news_app/config/theme/app_theme.dart';
import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/feature/home/data/data_source/remote/remote_data_source_impl.dart';
import 'package:news_app/observe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiManager();
  Bloc.observer = Observe();
  await RemoteDataSourceImpl().getTopHeadlines();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: child,
          initialRoute: AppRoutesName.home,
          onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
        );
      },
    );
  }
}
