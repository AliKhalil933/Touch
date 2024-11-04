import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/Desiner_Card.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Profile_Designer_page_view.dart';

final List<Map<String, dynamic>> designers = [
  {
    'name': 'لورا',
    'imageUrl': 'lib/assets/logo/profileman.png',
    'tags': ['ملابس رجالية', 'ملابس نسائية'],
  },
  {
    'name': 'جين',
    'imageUrl': 'lib/assets/logo/profilewoman.png',
    'tags': ['ملابس شتوية'],
  },
  {
    'name': 'أماني محمد',
    'imageUrl': 'lib/assets/logo/profilewoman2.png',
    'tags': ['ملابس أطفال', 'ملابس نسائية'],
  },
  {
    'name': 'مي أحمد',
    'imageUrl': 'lib/assets/logo/profilewoman.png',
    'tags': ['ملابس أطفال', 'ملابس رجالية', 'ملابس نسائية'],
  },
];
SizedBox BuildDesignerList() {
  return SizedBox(
    height: 150, // Set a fixed height for the designer cards
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: designers.length,
      itemBuilder: (context, index) {
        final designer = designers[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, DesignerPageView.routeName);
          },
          child: DesignerCard(
            imageUrl: designer['imageUrl'],
            name: designer['name'],
          ),
        );
      },
    ),
  );
}
