import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_project/constants.dart'; // Ensure this file contains KHorizontalPadding
import 'package:flutter_project/core/utils/app_colors.dart'; // Color definitions
import 'package:flutter_project/core/utils/app_images.dart'; // Image paths
import 'package:flutter_project/core/utils/app_text_stayel.dart'; // Text styles
import 'package:flutter_project/core/widgets/CustomButomWithIcon.dart';
import 'package:flutter_project/core/widgets/Custom_Arrow_BAck.dart'; // Custom Back button
import 'package:flutter_project/core/widgets/Widget_SizeSelectionPage.dart';
import 'package:flutter_project/feathuer/Cart/presentation/views/Cart_Page_view.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/BuildAnther_DethenerCard.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Build_New_Prodect_List.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Build_Prodect_max_buy.dart'; // Assets paths

class CategoryPageViewBody extends StatefulWidget {
  const CategoryPageViewBody({super.key});

  @override
  State<CategoryPageViewBody> createState() => _CategoryPageViewBodyState();
}

class _CategoryPageViewBodyState extends State<CategoryPageViewBody> {
  String? selectedSize;
  String? selectedColor;
  int pieceCount = 5;
  double rating = 2.0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                height: screenHeight * 0.5,
                width: double.infinity,
                child: Image.asset(
                  Assets.assetsAssetsImagesLoading2,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomActionButton(
                      icon: Icons.arrow_back,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CustomActionButton(
                      icon: Icons.shopping_cart,
                      onPressed: () {
                        Navigator.pushNamed(context, CartPageview.routeName);
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 343,
                left: 31,
                child: BuildAntherDethenerCard(context),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Row with 'جاكت' text and icons (Report and Favorite)
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Ensure space between
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: KHorizontalPadding),
                child: Text(
                  ' جاكت',
                  style: AppTextStyle.ffShamelBold18,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _showReportDialog(
                          context); // فتح الـ Dialog عند الضغط على زر الإبلاغ
                    },
                    icon: Image.asset(
                      Assets
                          .assetsAssetsImagesReport, // مسار صورة أيقونة البلاغ
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      print("تم الضغط على المفضلة");
                    },
                    icon: Image.asset(
                      Assets
                          .assetsAssetsImagesHeartGray, // Favorite icon image path
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Column(
            children: [
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: PannableRatingBar(
                    textDirection: TextDirection.rtl,
                    rate: rating,
                    items: List.generate(
                      5,
                      (index) => const RatingWidget(
                        selectedColor: AppColors.lightprimaryColor,
                        unSelectedColor: Colors.grey,
                        child: Icon(
                          Icons.star,
                          size: 15,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        rating = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: FractionalOffset.topRight,
                  child: Text(
                    'جاكت مبطن فرو من احسن الخامات واستخدام احسن الماكينات للصناعة',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'قابل للتعديل',
                    style: AppTextStyle.ffShamelBold14
                        .copyWith(color: AppColors.lightprimaryColor),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
                child: Row(
                  children: [
                    Text(
                      'المقاس',
                      style: AppTextStyle.ffShamelBold14
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    const SizedBox(width: 10),
                    selectedSize != null
                        ? Row(
                            children: [
                              Text(
                                'عدد القطع المتوفرة:  $selectedSize',
                                style: AppTextStyle.ffShamelRegular11,
                              ),
                              const SizedBox(width: 10),
                              pieceCountCircle(),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      sizeButton('S'),
                      const SizedBox(width: 8),
                      sizeButton('M'),
                      const SizedBox(width: 8),
                      sizeButton('L'),
                      const SizedBox(width: 8),
                      specialSizeButton(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // ألوان
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('الألوان:', style: AppTextStyle.ffShamelBold14),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        colorCircle(const Color(0xFFCF455D), 'أحمر'),
                        const SizedBox(width: 8),
                        colorCircle(const Color(0xFF5A4B58), 'أزرق'),
                        const SizedBox(width: 8),
                        colorCircle(const Color(0xFFF3D4B0), 'أخضر'),
                        const SizedBox(width: 8),
                        colorCircle(const Color(0xFF564A7E), 'أصفر'),
                        const SizedBox(width: 8),
                        colorCircle(const Color(0xFF000000), 'أسود'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonWithIcon(
                        onPressed: () {
                          Navigator.pushNamed(context, CartPageview.routeName);
                        },
                        text: 'اضافة الى السلة',
                        icon: const Icon(Icons.shopping_cart_outlined)),
                    Container(
                      width: 69,
                      height: 43,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFE8C8EC),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Color(0x29000000),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '100 ريال',
                          style: AppTextStyle.ffShamelBold14.copyWith(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'المنتجات المشابهة',
                    style: AppTextStyle.ffShamelBold18
                        .copyWith(color: AppColors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              BulidMaxbuyProdectList(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'اخر ماتم مشاهدته',
                    style: AppTextStyle.ffShamelBold18
                        .copyWith(color: AppColors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              BulidNewProdectList(),
            ],
          ),
        ],
      ),
    );
  }

  Widget sizeButton(String size) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedSize = size; // Select size
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedSize == size
                ? AppColors.lightprimaryColor
                : Colors.white,
            fixedSize: const Size(32, 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Color(0xFF707070)), // border color
            ),
          ),
          child: Text(size),
        ),
        const SizedBox(width: 4),
      ],
    );
  }

  Widget specialSizeButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, SizeSelectionPage.routeName);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        fixedSize: const Size(136, 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide.none,
        ),
        shadowColor: Colors.black.withOpacity(0.29),
        elevation: 3,
      ),
      child: Text(
        'مقاسات خاصة',
        style: AppTextStyle.ffShamelSemiBold11
            .copyWith(color: AppColors.primaryColor),
      ),
    );
  }

  Widget colorCircle(Color color, String colorName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = colorName;
        });
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
                selectedColor == colorName ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget pieceCountCircle() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFE8C8EC),
            offset: Offset(0, 3),
            blurRadius: 6,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          '$pieceCount',
          style: AppTextStyle.ffShamelBold14.copyWith(
            color: Colors.black,
            fontSize: 10,
          ),
        ),
      ),
    );
  }

  void _showReportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 40), // مساحة لزر X الطائر
                    TextField(
                      decoration: InputDecoration(
                        labelText: "نص البلاغ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        print("تم تقديم البلاغ");
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: AppColors.primaryColor, // لون الزر
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "إبلاغ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              // زر X الطائر لإغلاق الـ Dialog
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
