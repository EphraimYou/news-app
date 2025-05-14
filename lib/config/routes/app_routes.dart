import 'package:flutter/material.dart';
import 'package:news_app/feature/home/presentation/screens/home_screen.dart';
import 'package:news_app/feature/search/presentation/screens/search_result_screen.dart';
import 'package:news_app/feature/search/presentation/screens/search_screen.dart';

abstract class AppRoutesName {
  static const String home = '/home';
  static const String screenDetails = '/screenDetails';
  static const String searchResult = '/searchResult';
  static const String search = '/search';
}

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    var arg = settings.arguments;
    switch (settings.name) {
      case AppRoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutesName.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case AppRoutesName.searchResult:
        return MaterialPageRoute(
          builder: (_) => SearchResultScreen(query: arg as String),
        );
      default:
        return MaterialPageRoute(builder: (_) => defaultRoute());
    }
  }
}

Widget defaultRoute() => Scaffold(
  appBar: AppBar(title: const Text('No route defined')),
  body: Center(child: Text('Error 404')),
);
