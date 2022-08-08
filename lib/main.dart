import 'package:flutter/material.dart';
import 'package:imdb/bussines_logic/cubit/movies_cubit.dart';
import 'package:imdb/data/apis/movie_api.dart';
import 'package:imdb/data/repositories/movie_repostiory.dart';
import 'package:imdb/presentation/screens/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => MoviesCubit(MovieRepository(MovieAPI())),
        child: Home(),
      )
    );
  }
}