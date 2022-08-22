import 'package:flutter/material.dart';
import 'package:imdb/constants/colors.dart';
import 'package:imdb/constants/strings.dart';
import 'package:imdb/presentation/screens/itemss_screen/items_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  List<Widget> titles = [
    const Text("Top Rated Movies"),
    const Text("Top Rated TVs")
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secColor,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        title: titles[index],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: index == 0
            ? const ItemsScreen(isMovies: true)
            : const ItemsScreen(isMovies: false),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        child: BottomNavigationBar(
          elevation: 1,
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          backgroundColor: AppColors.mainColor,
          selectedItemColor: AppColors.secColor,
          showUnselectedLabels: false,
          unselectedItemColor: AppColors.disColor,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.movie_outlined),
              label: "Movies",
              activeIcon: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.secColor),
                child: const Icon(
                  Icons.movie_outlined,
                  color: AppColors.mainColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.tv_outlined),
              label: "TVs",
              activeIcon: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.secColor),
                child: const Icon(
                  Icons.tv_rounded,
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        onPressed: () {
          Navigator.pushNamed(context, RouteStrings.searchScreen);
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
