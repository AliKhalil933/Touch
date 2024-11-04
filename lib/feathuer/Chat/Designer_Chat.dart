import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/feathuer/Chat/Comvirsation_page_view.dart';
// تأكد من تعديل المسار حسب احتياجك

class DesignerchatPage extends StatelessWidget {
  const DesignerchatPage({super.key});
  static const routeName = 'DesignerchatPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              // انتقل إلى صفحة الدردشة عند الضغط على الكارت
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatPageView()),
              );
            },
            child: Container(
              width: 399,
              height: 99,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.29),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      Assets.assetsAssetsImagesProfilewoman, // صورة المصمم
                      width: 90,
                      height: 66, fit: BoxFit.cover,
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' حنين',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                '04:43:47',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '11-10-2022',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
