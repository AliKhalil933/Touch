import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class BaseCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  final Color titleColor; // اللون الخاص بالعنوان

  const BaseCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.titleColor, // إضافة لون العنوان
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 258,
      height: 129,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        border: Border.all(color: const Color(0xFF3E1B44)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 20,
              left: 100,
              child: Container(
                decoration: BoxDecoration(
                  color: titleColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(title,
                    style: AppTextStyle.ffShamelRegular18.copyWith(
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
