import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/widgets/Custom_Buttom.dart';

class TrackingPageViewBody extends StatefulWidget {
  const TrackingPageViewBody({super.key});

  @override
  State<TrackingPageViewBody> createState() => _TrackingPageViewBodyState();
}

class _TrackingPageViewBodyState extends State<TrackingPageViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container for order info (similar to the one in the image)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 6)
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  Assets
                      .assetsAssetsImagesBooking, // Replace with your image path
                  width: 100,
                  height: 100,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('رقم الطلب: #6695274', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 4),
                    Text('وقت الإنشاء: 2023-10-21 11:59 ص',
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 4),
                    Text('حالة الطلب: تم الشحن',
                        style: TextStyle(color: AppColors.primaryColor)),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Steps with checkboxes
          Column(
            children: [
              buildStep('تم استلام طلبك', Assets.assetsAssetsImagesInbox, true),
              buildStep(
                  'تم شحن طلبك', Assets.assetsAssetsImagesFastDelivery, true),
              buildStep('تم التسليم', Assets.assetsAssetsImagesReceive, false),
            ],
          ),
          const SizedBox(height: 20),
          // Action Buttons
          CustomButtom(
            text: 'تقييم الطلب',
            onPtrssed: () {
              _showRatingDialog(context);
            },
          ),
          const SizedBox(height: 10),
          CustomButtom(
            text: 'إعادة الطلب',
            onPtrssed: () {},
          ),
          const SizedBox(height: 10),
          CustomButtom(
            text: 'استرجاع',
            onPtrssed: () {},
          ),
          const SizedBox(height: 20),
          // Container for delivery address
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 6)
              ],
            ),
            child: const Row(
              children: [
                Icon(Icons.location_on,
                    size: 30, color: AppColors.primaryColor),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'المملكة العربية السعودية, منطقة مكة',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showRatingDialog(BuildContext context) {
    double rating = 2.0;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: 400, // Set dialog width
            height: 413, // Set dialog height
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.circular(10), // Border radius
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFE8C8EC), // Inner shadow color
                  blurRadius: 6,
                  spreadRadius: 3, // Inner shadow
                ),
                BoxShadow(
                  color: Color(0x3E1B4463), // Outer shadow color
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'تقييم الطلب',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                const Text('يرجى تقييم الطلب'),
                const SizedBox(height: 50),
                PannableRatingBar(
                  textDirection: TextDirection.rtl,
                  rate: rating,
                  items: List.generate(
                    5,
                    (index) => const RatingWidget(
                      selectedColor: AppColors.lightprimaryColor,
                      unSelectedColor: Colors.grey,
                      child: Icon(
                        Icons.star,
                        size: 40, // Set star width
                        weight: 38, // Set star height
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                ),
                const SizedBox(height: 150),
                Column(
                  children: [
                    CustomButtom(
                        onPtrssed: () {
                          Navigator.of(context).pop();
                        },
                        text: 'ارسال'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildStep(String title, String imagePath, bool isCompleted) {
    return Row(
      children: [
        Checkbox(
            value: isCompleted,
            onChanged: (bool? value) {},
            activeColor: Colors.green),
        Container(
          width: 85, // Set width
          height: 48, // Set height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:
                Colors.white, // You can adjust the background color if needed
          ),
          child: Image.asset(
            imagePath, // Replace with your image path
            fit: BoxFit.contain, // Adjust the image to fit the container
            color: AppColors.primaryColor, // Apply color
          ),
        ),
        const SizedBox(width: 12),
        Text(title, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
