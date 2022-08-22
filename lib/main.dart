import 'package:flutter/material.dart';
import 'package:imdb/app_router.dart';
import 'package:imdb/constants/strings.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteStrings.splashScreen,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}