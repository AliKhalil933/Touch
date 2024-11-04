import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/Story_card.dart';

SizedBox buildStoryList(BuildContext context) {
  final List<String> stories = [
    'lib/assets/images/pngegg.png',
    'lib/assets/images/watermelon-png.png',
    'lib/assets/images/watermelon-png.png',
    'lib/assets/images/watermelon-png.png',
    'lib/assets/images/pngegg.png',
  ];

  return SizedBox(
    height: 110,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: stories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: StoryCard(
            imageUrls: stories,
            index: index,
          ),
        );
      },
    ),
  );
}
