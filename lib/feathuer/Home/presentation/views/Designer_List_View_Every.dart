import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/core/widgets/Desiner_Card.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Profile_Designer_page_view.dart';

class DesignersListViewEvery extends StatelessWidget {
  DesignersListViewEvery({super.key});
  static const routeName = 'designerslistviewevery';

  final List<Map<String, dynamic>> designers = [
    {
      'name': 'لورا',
      'imageUrl': Assets.assetsAssetsImagesProfilewoman2,
    },
    {
      'name': 'جين',
      'imageUrl': Assets.assetsAssetsImagesProfilewoman2,
    },
    {
      'name': 'أماني محمد',
      'imageUrl': Assets.assetsAssetsImagesProfileman,
    },
    {
      'name': 'مي أحمد',
      'imageUrl': Assets.assetsAssetsImagesProfilewoman,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'المصممين'),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: designers.length,
        itemBuilder: (context, index) {
          final designer = designers[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                DesignerPageView.routeName,
                arguments: designer,
              );
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
}
