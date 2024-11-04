import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/utils/App_Constants.dart';
import 'package:flutter_project/core/widgets/Custom_Section_Heders.dart';
import 'package:flutter_project/core/widgets/custom_slider_widget.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Build_Categories_list.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Build_Designer_List_.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Build_New_Prodect_List.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Build_Prodect_max_buy.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Build_Story_list.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Build_prodect_list.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Designer_List_View_Every.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Prodect_List_Evrey.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/StoryListVieyEvery.dart';

class HomePageViewBody extends StatefulWidget {
  const HomePageViewBody({super.key});

  @override
  State<HomePageViewBody> createState() => _HomePageViewBodyState();
}

class _HomePageViewBodyState extends State<HomePageViewBody> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldLeave = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding: const EdgeInsets.all(16),
            content: Column(
              mainAxisSize: MainAxisSize.min, // تقييد الحجم لتجنب Overflow
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppConstants.Klogo,
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'لمسة',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'هل تريد الخروج من التطبيق؟',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('لا'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('نعم'),
              ),
            ],
          ),
        );
        return shouldLeave ?? false;
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSlider(),
              const SizedBox(height: 10),
              SectionHeader(title: 'الاقسام', onViewAll: () {}),
              const SizedBox(height: 20),
              BuildCategoryList(),
              const SizedBox(height: 10),
              SectionHeader(
                  title: 'القصص',
                  onViewAll: () {
                    Navigator.pushNamed(context, StoriesListView.routeName);
                  }),
              const SizedBox(height: 10),
              buildStoryList(context),
              const SizedBox(height: 10),
              SectionHeader(
                  title: 'مقدمي الخدمة',
                  onViewAll: () {
                    Navigator.pushNamed(
                        context, DesignersListViewEvery.routeName);
                  }),
              BuildDesignerList(),
              const SizedBox(height: 10),
              SectionHeader(
                  title: 'المنتجات الجديدة',
                  onViewAll: () {
                    Navigator.pushNamed(
                        context, ProductListPageEvrey.routeName);
                  }),
              const SizedBox(height: 10),
              BulidNewProdectList(),
              const SizedBox(height: 10),
              SectionHeader(
                  title: 'المنتجات الأكثر مبيعا ',
                  onViewAll: () {
                    Navigator.pushNamed(
                        context, ProductListPageEvrey.routeName);
                  }),
              const SizedBox(height: 10),
              BulidMaxbuyProdectList(),
              const SizedBox(height: 10),
              SectionHeader(
                  title: 'المنتجات',
                  onViewAll: () {
                    Navigator.pushNamed(
                        context, ProductListPageEvrey.routeName);
                  }),
              const SizedBox(height: 10),
              BuildProdectList(),
            ],
          ),
        ),
      ),
    );
  }
}
