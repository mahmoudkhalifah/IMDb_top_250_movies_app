import 'package:flutter/material.dart';
import 'package:imdb/bussines_logic/cubit/movies_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/bussines_logic/cubit/tvs_cubit.dart';
import 'package:imdb/constants/colors.dart';
import 'package:imdb/data/models/imdb_item.dart';
import 'package:imdb/presentation/widgets/item_card.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key, required this.isMovies}) : super(key: key);
  final bool isMovies;

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  late List<ImdbItem> items;

  @override
  void initState() {
    BlocProvider.of<MoviesCubit>(context).getTopRatedMovies();
    BlocProvider.of<TVsCubit>(context).getTopRatedTVs();
    super.initState();
  }

  Widget buildItemsList() {
    return RefreshIndicator(
      color: AppColors.mainColor,
      onRefresh: widget.isMovies ? refreshMovies : refreshTVs,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.separated(
                clipBehavior: Clip.none,
                itemBuilder: (context, index) => ItemCard(item: items[index]),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: items.length),
          ),
        ],
      ),
    );
  }

  Widget buildError(String errorMsg) {
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
            errorMsg,
            style: const TextStyle(color: Colors.red, fontSize: 30),
          ),
          MaterialButton(
              onPressed: widget.isMovies ? refreshMovies : refreshTVs)
        ],
      ),
    );
  }

  Future<void> refreshMovies() async {
    BlocProvider.of<MoviesCubit>(context).getTopRatedMovies();
  }

  Future<void> refreshTVs() async {
    BlocProvider.of<TVsCubit>(context).getTopRatedTVs();
  }

  Widget buildBlocMovies() {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoaded) {
          items = state.movies;
          return buildItemsList();
        } else if (state is MoviesLoadError) {
          return buildError(state.errorMsg);
        }
        return const Center(
            child: CircularProgressIndicator(
          color: AppColors.mainColor,
        ));
      },
    );
  }

  Widget buildBlocTVs() {
    return BlocBuilder<TVsCubit, TVsState>(
      builder: (context, state) {
        if (state is TVsLoaded) {
          items = state.tvs;
          return buildItemsList();
        } else if (state is TVsLoadError) {
          return buildError(state.errorMsg);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isMovies) {
      return buildBlocMovies();
    }
    return buildBlocTVs();
  }
}
