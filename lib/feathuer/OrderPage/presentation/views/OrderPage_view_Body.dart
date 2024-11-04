import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/core/widgets/Order_card_success_buy.dart';

class OrderPageViewBody extends StatefulWidget {
  const OrderPageViewBody({super.key});

  @override
  _OrderPageViewBodyState createState() => _OrderPageViewBodyState();
}

class _OrderPageViewBodyState extends State<OrderPageViewBody> {
  final PageController _pageController = PageController(initialPage: 2);
  int _selectedTab = 2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTabButtons(),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedTab = index;
                });
              },
              children: [
                _buildPaymentPendingOrders(),
                _buildUnderPreparationOrders(),
                _buildShippedOrders(),
                _buildReceivedOrders(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Scrollable Tab Buttons
  Widget _buildTabButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enables horizontal scrolling
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            _buildTabButton('بإنتظار الدفع', 0),
            const SizedBox(width: 10), // Adds some spacing between buttons
            _buildTabButton('قيد التحضير', 1),
            const SizedBox(width: 10),
            _buildTabButton('تم الشحن', 2),
            const SizedBox(width: 10),
            _buildTabButton('تم الإستلام', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedTab = index;
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(90, 43), // Width: 90, Height: 43
        foregroundColor: _selectedTab == index ? Colors.white : Colors.black,
        backgroundColor:
            _selectedTab == index ? AppColors.primaryColor : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(color: Colors.grey.shade100, width: 2),
      ),
      child: Text(
        title,
        style: AppTextStyle.ffShamelRegular13.copyWith(
            color: _selectedTab == index ? Colors.grey : Colors.black),
      ),
    );
  }

  Widget _buildPaymentPendingOrders() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 116,
          height: 211,
          child: Image.asset(
            Assets.assetsAssetsImagesFolder,
            fit: BoxFit.fill,
            width: 116,
            height: 211,
          ),
        ),
        Center(
          child: Text('لا يوجد طلبات متوفرة',
              style: AppTextStyle.ffShamelBold14
                  .copyWith(color: AppColors.primaryColor)),
        ),
      ],
    );
  }

  Widget _buildUnderPreparationOrders() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 116,
          height: 211,
          child: Image.asset(
            Assets.assetsAssetsImagesFolder,
            fit: BoxFit.fill,
            width: 116,
            height: 211,
          ),
        ),
        Center(
          child: Text('لا يوجد طلبات متوفرة',
              style: AppTextStyle.ffShamelBold14
                  .copyWith(color: AppColors.primaryColor)),
        ),
      ],
    );
  }

  Widget _buildShippedOrders() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
          horizontal: KHorizontalPadding, vertical: 10),
      itemBuilder: (context, index) {
        return const OrderSuccessShipped();
      },
      itemCount: 1,
      physics: const AlwaysScrollableScrollPhysics(),
    );
  }

  Widget _buildReceivedOrders() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
          horizontal: KHorizontalPadding, vertical: 10),
      itemBuilder: (context, index) {
        return const OrderSuccessShipped();
      },
      itemCount: 6,
      physics: const AlwaysScrollableScrollPhysics(),
    );
  }
}
