import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/Product_Card_For_NewProduct.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Category_page_View.dart';

final List<Map<String, String>> newProducts = [
  {
    'imageUrl': 'lib/assets/images/pngegg.png',
    'name': 'فستان صيفي',
    'price': '250'
  },
  {
    'imageUrl': 'lib/assets/images/pngegg.png',
    'name': 'حذاء رياضي',
    'price': '150'
  },
  {
    'imageUrl': 'lib/assets/images/pngegg.png',
    'name': 'حقيبة يد',
    'price': '300'
  },
  {'imageUrl': 'lib/assets/images/pngegg.png', 'name': 'قبعة', 'price': '100'},
];

SizedBox BulidNewProdectList() {
  return SizedBox(
    height: 200,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: newProducts.length,
      itemBuilder: (context, index) {
        final product = newProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, CategoryPageView.routeName);
          },
          child: ProductCardForNewProduct(
            imageUrl: product['imageUrl']!,
            productName: product['name']!,
            price: product['price']!,
          ),
        );
      },
    ),
  );
}
