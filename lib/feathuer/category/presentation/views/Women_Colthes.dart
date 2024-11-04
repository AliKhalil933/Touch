import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/core/widgets/Women_prodect_card.dart';

import 'package:flutter_project/feathuer/Home/presentation/views/Build_Categories_list.dart';

class WomenColthes extends StatefulWidget {
  const WomenColthes({super.key});
  static const routeName = 'WomenColthes';

  @override
  State<WomenColthes> createState() => _WomenColthesState();
}

class _WomenColthesState extends State<WomenColthes> {
  String selectedSort = 'اختر';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'ملابس نسائية'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'الأقسام',
                  style: AppTextStyle.ffShamelBold18.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              BuildCategoryList(),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'المنتجات',
                  style: AppTextStyle.ffShamelBold18.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      // استبدال الأيقونة بصورة
                      Image.asset(
                        'lib/assets/logo/filter_alt.png', // استبدل بمسار الصورة الخاص بك
                        width: 20, // عرض الصورة
                        height: 20, // ارتفاع الصورة
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'تصنيف حسب',
                        style: AppTextStyle.ffShamelBold18.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedSort == 'اختر' ? null : selectedSort,
                        icon: const Icon(Icons.arrow_drop_down,
                            color: AppColors.black),
                        items: const [
                          DropdownMenuItem(
                            value: 'اختر',
                            child: Text('اختر'),
                          ),
                          DropdownMenuItem(
                            value: 'الأعلى سعر',
                            child: Text('الأعلى سعر'),
                          ),
                          DropdownMenuItem(
                            value: 'الأقل سعر',
                            child: Text('الأقل سعر'),
                          ),
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedSort = newValue!;
                          });
                        },
                        hint: const Text('اختر'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: 6, // عدد المنتجات
                itemBuilder: (context, index) {
                  return const WomenProductCard(
                    imageUrl:
                        'lib/assets/images/pngegg.png', // يجب تحديثه حسب المنتج
                    productName: 'فستان', // تحديث اسم المنتج حسب الحاجة
                    productPrice: '100 ريال', // تحديث السعر حسب الحاجة
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}