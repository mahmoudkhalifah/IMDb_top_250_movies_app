import 'package:flutter/material.dart';
import 'package:imdb/constants/colors.dart';

class ErrorRouteScreen extends StatelessWidget {
  const ErrorRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.error,
              color: Colors.red,
              size: 50,
            ),
            Text("Page Not Found",style: TextStyle(fontSize: 25),)
          ],
        ),
      ),
    );
  }
}
