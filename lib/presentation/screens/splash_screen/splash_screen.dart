import 'dart:async';

import 'package:flutter/material.dart';
import 'package:imdb/constants/colors.dart';
import 'package:imdb/constants/strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1),
        () => Navigator.pushReplacementNamed(context, RouteStrings.homeScreen));
    return const Scaffold(
      backgroundColor: AppColors.mainColor
    );
  }
}
