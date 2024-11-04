import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/feathuer/Cart/presentation/views/Cart_Page_view.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/Setting_Page_view.dart';

// ignore: non_constant_identifier_names
AppBar BuildAppBarHomepage(context, {required String Title}) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    leading: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SettingPageView.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 20,
          height: 20,
          child: Image.asset('lib/assets/logo/menu.png'),
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      Title,
      style: AppTextStyle.ffShamelBold19.copyWith(color: AppColors.white),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Row(
          children: [
            IconButton(
              icon: SizedBox(
                width: 20,
                height: 20,
                child: Image.asset('lib/assets/logo/cart.png'),
              ),
              onPressed: () {
                Navigator.pushNamed(context, CartPageview.routeName);
              },
            ),
            IconButton(
              icon: SizedBox(
                width: 20,
                height: 20,
                child: Image.asset('lib/assets/logo/search.png'),
              ),
              onPressed: () {
                // Add your logic for search action
              },
            ),
          ],
        ),
      ),
    ],
  );
}
