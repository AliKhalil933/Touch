import 'package:flutter/material.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Story_View.dart';

class StoriesListView extends StatelessWidget {
  const StoriesListView({super.key});
  static const String routeName = 'StoriesListView';

  @override
  Widget build(BuildContext context) {
    final List<String> stories = [
      'lib/assets/images/pngegg.png',
      'lib/assets/images/watermelon-png.png',
      'lib/assets/images/pngegg.png',
      'lib/assets/images/watermelon-png.png',
      'lib/assets/images/pngegg.png',
      'lib/assets/images/watermelon-png.png',
      'lib/assets/images/pngegg.png',
      'lib/assets/images/watermelon-png.png',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('القصص'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryView(
                    imageUrls: stories,
                    currentIndex: index,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(stories[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
