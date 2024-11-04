import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/utils/App_Constants.dart'; // تأكد أن هذا المسار صحيح
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/%D9%90About_US_pageView.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/Complaints_PageView.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/ContactUsPage.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/Developer_Info_Page.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/FAQ_PageView.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/Favorites_PageView.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/Privacy_Policy.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/Setting_Of_Setting.dart';
import 'package:flutter_project/feathuer/TearmsAndConditions/presentation/views/Terms_And_Conditions2.dart';
import 'package:flutter_project/feathuer/auth/presentation/views/login_View.dart';

class SettingPageViewBody extends StatefulWidget {
  const SettingPageViewBody({super.key});

  @override
  _SettingPageViewBodyState createState() => _SettingPageViewBodyState();
}

class _SettingPageViewBodyState extends State<SettingPageViewBody> {
  bool _isSubscriptionFormVisible = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(AppConstants.Klogo),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildListTile(
                  context,
                  iconPath: Assets.assetsAssetsImagesInfo,
                  title: 'من نحن',
                  onTap: () {
                    Navigator.pushNamed(context, AboutUsViewPage.routeName);
                  },
                ),
                _buildListTile(
                  context,
                  iconPath: Assets.assetsAssetsImagesNotListedLocation,
                  title: 'الأسئلة الشائعة',
                  onTap: () {
                    Navigator.pushNamed(context, FaqPageview.routeName);
                  },
                ),
                _buildListTile(
                  context,
                  iconPath: Assets.assetsAssetsImagesAccountBalanceWallet,
                  title: 'المفضلة',
                  onTap: () {
                    Navigator.pushNamed(context, FavoritesPageview.routeName);
                  },
                ),
                _buildListTile(
                  context,
                  iconPath: Assets.assetsAssetsImagesListAlt,
                  title: 'الشكاوي والمقترحات',
                  onTap: () {
                    Navigator.pushNamed(context, ComplaintsPageview.routeName);
                  },
                ),
                _buildListTile(
                  context,
                  iconPath: Assets.assetsAssetsImagesPhoneCall,
                  title: 'اتصل بنا',
                  onTap: () {
                    Navigator.pushNamed(context, ContactUsPage.routeName);
                  },
                ),
                _buildListTile(
                  context,
                  iconPath: Assets.assetsAssetsImagesCheckAll,
                  title: 'سياسة الخصوصية',
                  onTap: () {
                    Navigator.pushNamed(context, PrivacyPolicy.routeName);
                  },
                ),
                _buildListTile(
                  context,
                  iconPath: Assets.assetsAssetsImagesCheckAll,
                  title: 'الشروط والأحكام',
                  onTap: () {
                    Navigator.pushNamed(context, TermsAndConditions2.routeName);
                  },
                ),
                _buildListTile(
                  context,
                  iconPath: Assets.assetsAssetsImagesListAlt,
                  title: 'عن المطور',
                  onTap: () {
                    Navigator.pushNamed(context, DeveloperInfoPage.routeName);
                  },
                ),
                _buildListTile(
                  context,
                  iconPath: Assets.assetsAssetsImagesSettings,
                  title: 'الإعدادات',
                  onTap: () {
                    Navigator.pushNamed(context, SettingOfSetting.routeName);
                  },
                ),
                _buildListTile(
                  context,
                  iconPath: Assets.assetsAssetsImagesLogout,
                  title: 'تسجيل الخروج',
                  onTap: () async {
                    Navigator.pushReplacementNamed(
                        context, LoginView.routeName);
                  },
                ),
                const Divider(thickness: 1),
                ListTile(
                  leading: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey[200],
                    child: Image.asset(
                      Assets.assetsAssetsImagesListAlt,
                      width: 14,
                      height: 10,
                    ),
                  ),
                  title: Text(
                    'قائمة الاشتراك البريدي',
                    style: AppTextStyle.ffShamelRegular17.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _isSubscriptionFormVisible = !_isSubscriptionFormVisible;
                    });
                  },
                ),
                Visibility(
                  visible: _isSubscriptionFormVisible,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.email_rounded,
                                color: AppColors.primaryColor,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'اشترك بالقائمة البريدية',
                                style: AppTextStyle.ffShamelRegular17
                                    .copyWith(color: AppColors.black),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: Container(
                              height: 1,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.black, // لون الخط
                                    Colors.black,
                                    Colors.transparent,
                                  ],
                                  stops: [0.0, 0.2, 0.8, 1.0],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: KHorizontalPadding),
                            child: Text(
                              'ليصلك كل جديد ضع بريدك الإلكتروني',
                              style: AppTextStyle.ffShamelRegular13
                                  .copyWith(color: AppColors.black),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'البريد الإلكتروني',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 228,
                                child: SizedBox(
                                  width: 120,
                                  height: 53,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Functionality to subscribe user
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: AppColors.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: const Text('اشترك الآن'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          icon: Image.asset(
                              Assets.assetsAssetsImagesSnapchatIcon),
                          onPressed: () {
                            // Snapchat link
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          icon: Image.asset(
                              Assets.assetsAssetsImagesFacebookIcon),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          icon: Image.asset(
                              Assets.assetsAssetsImagesInstagramIcon),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          icon:
                              Image.asset(Assets.assetsAssetsImagesTiktokIcon),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildListTile(BuildContext context,
    {required String iconPath,
    required String title,
    required VoidCallback onTap}) {
  return Column(
    children: [
      const Divider(thickness: 1),
      ListTile(
        leading: Container(
          width: 31,
          height: 31,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(15.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                offset: const Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Container(
            width: 14,
            height: 13,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 246, 243, 247),
              borderRadius: BorderRadius.circular(3.5),
            ),
            child: Center(
              child: Image.asset(
                iconPath,
                width: 14,
                height: 13,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          title,
          style:
              AppTextStyle.ffShamelRegular17.copyWith(color: AppColors.black),
        ),
        trailing: const Icon(null),
        onTap: onTap,
      ),
    ],
  );
}
