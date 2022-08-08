import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/bussines_logic/cubit/movies_cubit.dart';
import 'package:imdb/data/models/movie.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Movie> movies;
  @override
  void initState() {
    BlocProvider.of<MoviesCubit>(context).getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            if (state is MoviesLoaded) {
              movies = state.movies;
              return ListView.separated(
                  itemBuilder: (context, index) => Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.6,
                              width: double.infinity,
                              child: Image.network(
                                movies[index].imageUrl,
                                fit: BoxFit.cover,
                              )),
                          Text(
                            movies[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                shadows: [
                                  Shadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                    color: Colors.black,
                                  ),
                                ]),
                          )
                        ],
                      ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: movies.length);
            } else if (state is MoviesLoadError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error,
                      size: 60,
                      color: Colors.red,
                    ),
                    Text(
                      state.errorMsg,
                      style: const TextStyle(color: Colors.red, fontSize: 30),
                    )
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
