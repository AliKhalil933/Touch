import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/App_Constants.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';

class SettingOfSetting extends StatelessWidget {
  static const routeName = 'SettingOfSetting';
  const SettingOfSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: ''),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Image.asset(
              AppConstants.Klogo,
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 20),

            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('العناوين'),
              trailing: const Icon(Icons.help_outline),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('تعديل البيانات'),
              trailing: const Icon(Icons.info_outline),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('تغيير اللغة'),
              trailing: const Icon(Icons.check),
              onTap: () {},
            ),
            const Divider(),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      icon: Image.asset(Assets.assetsAssetsImagesTwitter),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      icon: Image.asset(Assets
                          .assetsAssetsImagesFacebookIcon), // أيقونة فيسبوك
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      icon: Image.asset(Assets
                          .assetsAssetsImagesInstagramIcon), // أيقونة انستقرام
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      icon: Image.asset(
                          Assets.assetsAssetsImagesTiktokIcon), // أيقونة TikTok
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Version and copyright text
            const Text(
              'الإصدار : 1',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            const Text(
              '© كل الحقوق محفوظة 2023',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
