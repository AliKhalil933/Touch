import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/BaseCard.dart';
import 'package:flutter_project/feathuer/category/presentation/views/Keds_Colthes.dart';
import 'package:flutter_project/feathuer/category/presentation/views/Men_Colthes.dart';
import 'package:flutter_project/feathuer/category/presentation/views/Women_Colthes.dart';

class CategoryWidget extends StatelessWidget {
  final List<Map<String, String>> categories;

  const CategoryWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 12);
        },
        itemBuilder: (BuildContext context, int index) {
          final category = categories[index];
          switch (category['title']) {
            case 'ملابس رجالية':
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MenColthes.routeName);
                },
                child: MenCard(
                  title: category['title']!,
                  imageUrl: category['imageUrl']!,
                  badgeText: category['badgeText']!,
                ),
              );
            case 'ملابس نسائية':
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, WomenColthes.routeName);
                },
                child: WomenCard(
                  title: category['title']!,
                  imageUrl: category['imageUrl']!,
                  badgeText: category['badgeText']!,
                ),
              );
            case 'ملابس اطفالي':
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, KidsColthes.routeName);
                },
                child: KidsCard(
                  title: category['title']!,
                  imageUrl: category['imageUrl']!,
                  badgeText: category['badgeText']!,
                ),
              );

            default:
              return Container();
          }
        },
      ),
    );
  }
}
