import 'package:flutter_project/feathuer/Home/presentation/views/category_Widget.dart';

final List<Map<String, String>> categories = [
  {
    'title': 'ملابس رجالية',
    'imageUrl': 'lib/assets/images/pngegg.png',
    'badgeText': 'جديد',
  },
  {
    'title': 'ملابس نسائية',
    'imageUrl': 'lib/assets/images/pngegg.png',
    'badgeText': 'مميز',
  },
  {
    'title': 'ملابس اطفالي',
    'imageUrl': 'lib/assets/images/pngegg.png',
    'badgeText': 'جديد',
  },
];

CategoryWidget BuildCategoryList() => CategoryWidget(categories: categories);
