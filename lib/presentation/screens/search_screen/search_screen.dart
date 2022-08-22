import 'package:flutter/material.dart';
import 'package:imdb/bussines_logic/cubit/search_cubit.dart';
import 'package:imdb/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/data/models/search_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<SearchItem> items;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: TextField(
          controller: searchController,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              //prefixIcon: const Icon(Icons.search,color: Colors.white,),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  BlocProvider.of<SearchCubit>(context)
                      .search(searchController.text);
                      print("clicked");
                },
              ),
              hintText: "Search",
              hintStyle: const TextStyle(color: Colors.white),
              labelStyle: const TextStyle(color: Colors.white),
              contentPadding: const EdgeInsets.all(15),
              border: InputBorder.none),
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          print(state);
          if (state is SearchDataLoading) {
            print("loading");
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchDataLoaded) {
            items = state.items;
            print(items);
            return buildList();
          }
          return Text("Hello");
        },
      ),
    );
  }

  Widget buildList() {
    return ListView.separated(
        itemBuilder: (context, index) => Image.network(items[index].imageUrl),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: items.length);
  }
}
