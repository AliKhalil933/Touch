import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/utils/App_Constants.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';

class FavoritesPageview extends StatelessWidget {
  const FavoritesPageview({super.key});
  static const routeName = "FavoritesPageview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'المفضلة'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: KHorizontalPadding,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Image.asset(
              AppConstants.logoPath,
              width: 150,
              height: 150,
            ),
          ),
          const SizedBox(height: 80),
          const Center(
              child: Text(
            'لايوجد مفضلة حتي الان',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ))
        ]),
      ),
    );
  }
}
