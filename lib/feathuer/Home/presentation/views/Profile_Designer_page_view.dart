import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart'; // مكتبة PannableRatingBar
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/core/widgets/Custom_Arrow_BAck.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Build_Categories_list.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Build_Story_list.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Build_prodect_list.dart';
import 'package:flutter_project/feathuer/TearmsAndConditions/presentation/views/Terms_And_Conditions.dart'; // ملف النصوص الخاص بالمشروع

class DesignerPageView extends StatefulWidget {
  static const String routeName = 'profilepageView';

  const DesignerPageView({super.key});
  @override
  _DesignerPageViewState createState() => _DesignerPageViewState();
}

class _DesignerPageViewState extends State<DesignerPageView> {
  int followersCount = 5;
  bool isFollowing = false;
  double rating = 2.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 190.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: [
                    'lib/assets/logo/slider2.png',
                    'lib/assets/logo/slider2.png',
                    'lib/assets/logo/slider2.png',
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.asset(
                          i,
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.white,
                        backgroundImage:
                            AssetImage(Assets.assetsAssetsImagesProfilewoman2),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'اتمام تجربة',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          PannableRatingBar(
                            textDirection: TextDirection.rtl,
                            rate: rating,
                            items: List.generate(
                              5,
                              (index) => const RatingWidget(
                                selectedColor: AppColors.lightprimaryColor,
                                unSelectedColor: Colors.grey,
                                child: Icon(
                                  Icons.star,
                                  size: 15,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                rating = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            '(',
                            style: AppTextStyle.ffShamelRegular16.copyWith(),
                          ),
                          Text(
                            '$followersCount',
                            style: AppTextStyle.ffShamelRegular16.copyWith(
                              color: AppColors.lightprimaryColor,
                            ),
                          ),
                          Text(
                            ')',
                            style: AppTextStyle.ffShamelRegular16.copyWith(),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 90,
                            height: 43,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.16),
                                  offset: const Offset(0, 3),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isFollowing = !isFollowing;
                                  followersCount += isFollowing ? 1 : -1;
                                });
                              },
                              child: Text(isFollowing ? 'الغاء' : 'متابعة',
                                  style:
                                      AppTextStyle.ffShamelRegular16.copyWith(
                                    color: AppColors.black,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: KHorizontalPadding),
                  child: Text(
                    'مصمم ملابس نسائية ورجالية وأطفال ولدي خبرة في مجال التصميم الإبداعي بخبرة اكثر من اربع سنوات', // العنوان الفرعي
                    style: AppTextStyle.ffShamelRegular11,
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'القصص',
                      style: AppTextStyle.ffShamelBold16
                          .copyWith(color: AppColors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                buildStoryList(context),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: KHorizontalPadding),
                    child: Text(
                      'الاقسام',
                      style: AppTextStyle.ffShamelBold16
                          .copyWith(color: AppColors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                BuildCategoryList(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: KHorizontalPadding),
                      child: Text(
                        'المنتجات',
                        style: AppTextStyle.ffShamelBold16
                            .copyWith(color: AppColors.black),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, TermsAndCondistionsPageView.routeName);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            AppColors.primaryColor,
                            AppColors.tharedColor
                          ]),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        child: Text(
                          'تصميم خاص',
                          style: AppTextStyle.ffShamelRegular16
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                BuildProdectList(),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            top: 25,
            right: 8,
            child: CustomActionButton(
              icon: Icons.arrow_back,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
