import 'package:flutter/material.dart';
import 'package:imdb/bussines_logic/cubit/movies_cubit.dart';
import 'package:imdb/bussines_logic/cubit/search_cubit.dart';
import 'package:imdb/bussines_logic/cubit/tvs_cubit.dart';
import 'package:imdb/constants/strings.dart';
import 'package:imdb/data/apis/movies_api.dart';
import 'package:imdb/data/apis/search_api.dart';
import 'package:imdb/data/apis/tvs_api.dart';
import 'package:imdb/data/repositories/movies_repostiory.dart';
import 'package:imdb/data/repositories/search_repository.dart';
import 'package:imdb/data/repositories/tvs_repository.dart';
import 'package:imdb/presentation/screens/details_screen/details_screen.dart';
import 'package:imdb/presentation/screens/error_route_screen/error_route_screen.dart';
import 'package:imdb/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/presentation/screens/search_screen/search_screen.dart';
import 'package:imdb/presentation/screens/splash_screen/splash_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteStrings.splashScreen:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });

      case RouteStrings.homeScreen:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => MoviesCubit(MoviesRepository(MoviesAPI())),
              ),
              BlocProvider(
                create: (context) => TVsCubit(TVsRepository(TVsAPI())),
              ),
            ],
            child: const Home(),
          );
        });

      case RouteStrings.detailsScreen:
        final args = settings.arguments as DetailsScreen;
        return MaterialPageRoute(builder: (context) {
          return DetailsScreen(item: args.item);
        });

      case RouteStrings.searchScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => SearchCubit(SearchRepository(SearchAPI())),
              child: const SearchScreen(),
            );
          },
        );

      default:
        return MaterialPageRoute(
            builder: (context) => const ErrorRouteScreen());
    }
  }
}
