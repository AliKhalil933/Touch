import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/widgets/Custom_Buttom.dart';
import 'package:flutter_project/feathuer/TrackingPage/presentation/views/Tracking_PageView.dart';

class SuccessorderPageview extends StatelessWidget {
  const SuccessorderPageview({super.key});

  static const routeName = 'SuccessorderPageview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 116,
            height: 211,
            child: Image.asset(
              Assets.assetsAssetsImagesThin, // تأكد من أن المسار صحيح للصور
              fit: BoxFit.cover,
              width: 116,
              height: 211,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'تم تأكيد الطلب بنجاح',
            style: TextStyle(fontSize: 18), // يمكنك تعديل الخط حسب الحاجة
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
              child: CustomButtom(
                onPtrssed: () {
                  Navigator.pushNamed(context, TrackingPageView.routeName);
                },
                text: 'تتبع الطلب',
              ),
            ),
          )
        ],
      ),
    );
  }
}
