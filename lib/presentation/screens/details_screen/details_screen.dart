import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:imdb/data/models/imdb_item.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.item}) : super(key: key);
  final ImdbItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Hero(
          tag: item.id,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Image.network(
              item.imageUrl,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.rank.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                LimitedBox(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                  child: Text(item.title,
                      maxLines: 3,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                      )),
                ),
                Text(
                  item.year.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w300),
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.yellow,
                      size: 35,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(item.rating.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,)),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(children: [
                  const Icon(
                      Icons.people,
                      color: Colors.white,
                      size: 35,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(item.ratingCount.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,)),
                ],),
                const Spacer(),
                LimitedBox(
                  maxHeight: 30,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Text(
                      item.crew[index],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(width: 25,),
                    itemCount: item.crew.length,
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
