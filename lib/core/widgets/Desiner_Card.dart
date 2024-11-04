import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class DesignerCard extends StatelessWidget {
  final String imageUrl;
  final String name;

  const DesignerCard({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // قسم الصورة
              Expanded(
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity, // يضمن أن تأخذ الصورة العرض الكامل
                ),
              ),
              // قسم النص
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  name,
                  style: AppTextStyle.ffShamelBold14, // تنسيق النص
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
