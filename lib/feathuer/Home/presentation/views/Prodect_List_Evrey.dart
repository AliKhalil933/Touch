import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/core/widgets/ProdectCArtEvry.dart';

class ProductListPageEvrey extends StatelessWidget {
  static const routeName = 'productlistEvery';
  final List<Map<String, String>> products = [
    {
      'imageUrl': Assets.assetsAssetsImagesWatermelonPng,
      'productName': 'جاكت',
      'price': '100',
      'description':
          'جاكت مبطن فرو من احسن الخامات واستخدام احسن الماكينات للصناعة ',
    },
    {
      'imageUrl': Assets.assetsAssetsImagesPngegg,
      'productName': 'جاكت',
      'price': '200',
      'description':
          'جاكت مبطن فرو من احسن الخامات واستخدام احسن الماكينات للصناعة ',
    },
    {
      'imageUrl': Assets.assetsAssetsImagesPngegg,
      'productName': 'جاكت',
      'price': '300',
      'description':
          'جاكت مبطن فرو من احسن الخامات واستخدام احسن الماكينات للصناعة ',
    },
    {
      'imageUrl': Assets.assetsAssetsImagesPngegg,
      'productName': 'جاكت',
      'price': '400',
      'description':
          'جاكت مبطن فرو من احسن الخامات واستخدام احسن الماكينات للصناعة ',
    },
    {
      'imageUrl': Assets.assetsAssetsImagesPngegg,
      'productName': 'جاكت',
      'price': '400',
      'description':
          'جاكت مبطن فرو من احسن الخامات واستخدام احسن الماكينات للصناعة ',
    },
    {
      'imageUrl': Assets.assetsAssetsImagesPngegg,
      'productName': 'جاكت',
      'price': '400',
      'description':
          'جاكت مبطن فرو من احسن الخامات واستخدام احسن الماكينات للصناعة ',
    },
    {
      'imageUrl': Assets.assetsAssetsImagesPngegg,
      'productName': 'جاكت',
      'price': '400',
      'description':
          'جاكت مبطن فرو من احسن الخامات واستخدام احسن الماكينات للصناعة ',
    },
  ];

  ProductListPageEvrey({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'المنتجات'),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCardForProductEvery(
            imageUrl: products[index]['imageUrl']!,
            productName: products[index]['productName']!,
            price: products[index]['price']!,
            description: products[index]['description']!,
          );
        },
      ),
    );
  }
}
