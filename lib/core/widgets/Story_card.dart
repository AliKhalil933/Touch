import 'package:flutter/material.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Story_View.dart';

class StoryCard extends StatelessWidget {
  final List<String> imageUrls; // قائمة الصور
  final int index; // فهرس الصورة

  const StoryCard({super.key, required this.imageUrls, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                StoryView(imageUrls: imageUrls, currentIndex: index),
          ),
        );
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrls[index]),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              offset: const Offset(0, 1),
              blurRadius: 2,
            ),
          ],
        ),
      ),
    );
  }
}
