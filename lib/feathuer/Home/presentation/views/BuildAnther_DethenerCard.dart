import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Profile_Designer_page_view.dart';

GestureDetector BuildAntherDethenerCard(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, DesignerPageView.routeName);
    },
    child: Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: const DecorationImage(
          image: AssetImage(Assets.assetsAssetsImagesProfilewoman2),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(52),
      ),
      alignment: Alignment.center,
      child: const Text(
        'مي',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
      ),
    ),
  );
}
