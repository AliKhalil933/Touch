import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/feathuer/Chat/Designer_Chat.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Home_page_View.dart';
import 'package:flutter_project/feathuer/OrderPage/presentation/views/Order_page_view.dart';
import 'package:flutter_project/feathuer/NavigationBar/presentation/views/Setting_Account_page_View.dart';
import 'package:flutter_project/feathuer/Notification/presentation/views/Notification_page_view.dart';

class CustomNavigationBarBody extends StatefulWidget {
  const CustomNavigationBarBody({super.key});

  @override
  _CustomNavigationBarBodyState createState() =>
      _CustomNavigationBarBodyState();
}

class _CustomNavigationBarBodyState extends State<CustomNavigationBarBody> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const HomePageView(),
    const NotificitonPageView(),
    const SettingAccountPageView(),
    const DesignerchatPage(),
    const OrderPageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // إذا لم نكن في الصفحة الرئيسية ونريد الرجوع إليها
        if (selectedIndex != 0) {
          setState(() {
            selectedIndex = 0;
          });
          return false;
        }

        // التحقق مما إذا كان يمكننا الرجوع عبر Navigator
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          return true;
        } else {
          return false;
        }
      },
      child: Scaffold(
        body: screens[selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          index: selectedIndex,
          height: 60.0,
          items: List.generate(
            screens.length,
            (index) => _buildCircleIcon(
              getIconForIndex(index, index == selectedIndex),
              index == selectedIndex,
            ),
          ),
          color: AppColors.primaryColor.withOpacity(0.1),
          buttonBackgroundColor: AppColors.white.withOpacity(0.1),
          backgroundColor: AppColors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }

  Widget _buildCircleIcon(Widget iconWidget, bool isSelected) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isSelected)
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: iconWidget,
            ),
          )
        else
          iconWidget,
      ],
    );
  }

  Widget getIconForIndex(int index, bool isSelected) {
    switch (index) {
      case 0:
        return Image.asset(
          isSelected
              ? 'lib/assets/logo/home_color.png'
              : 'lib/assets/logo/home_gray.png',
          width: 20,
          height: 20,
        );
      case 1:
        return Image.asset(
          isSelected
              ? 'lib/assets/logo/notifications_color.png'
              : 'lib/assets/logo/notifications_gray.png',
          width: 20,
          height: 20,
        );
      case 2:
        return Image.asset(
          isSelected
              ? 'lib/assets/logo/perosn.png'
              : 'lib/assets/logo/person_gray.png',
          width: 20,
          height: 20,
        );
      case 3:
        return Image.asset(
          isSelected
              ? 'lib/assets/logo/chat.png'
              : 'lib/assets/logo/message.png',
          width: 20,
          height: 20,
        );
      case 4:
      default:
        return Image.asset(
          isSelected
              ? 'lib/assets/logo/list_color.png'
              : 'lib/assets/logo/list_gray.png',
          width: 20,
          height: 20,
        );
    }
  }
}
