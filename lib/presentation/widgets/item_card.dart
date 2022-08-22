import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imdb/constants/strings.dart';
import 'package:imdb/data/models/imdb_item.dart';
import 'package:imdb/presentation/screens/details_screen/details_screen.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.item}) : super(key: key);

  final ImdbItem item;

  final Shadow shadow = const Shadow(
    offset: Offset(0, 0),
    blurRadius: 30,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteStrings.detailsScreen,arguments: DetailsScreen(item: item));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: Hero(
                tag: item.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4), BlendMode.srcATop),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Image.network(
                        item.imageUrl,
                        alignment: Alignment.topCenter,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LimitedBox(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        item.title,
                        maxLines: 3,
                        softWrap: true,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            shadows: [shadow]),
                      ),
                    ),
                    Text(
                      item.rank.toString(),
                      style: TextStyle(
                          color: Colors.white, fontSize: 35, shadows: [shadow],fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(item.year,
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, shadows: [shadow],fontWeight: FontWeight.w300)),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.25,
                ),
                
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.yellow,
                      size: 35,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(item.rating.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            shadows: [shadow])),
                    const Spacer(),
                    const Icon(
                      Icons.people,
                      color: Colors.white,
                      size: 35,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(item.ratingCount.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            shadows: [shadow])),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
