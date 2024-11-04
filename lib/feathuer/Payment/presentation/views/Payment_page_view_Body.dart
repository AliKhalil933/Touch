import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/core/widgets/Custom_Buttom.dart';
import 'package:flutter_project/feathuer/Payment/presentation/views/Build_OrderSummary.dart';
import 'package:flutter_project/feathuer/Payment/presentation/views/PaymentContainer.dart';
import 'package:flutter_project/feathuer/Payment/presentation/views/SuccessOrder_PageView.dart';
import 'package:flutter_project/feathuer/Payment/presentation/views/build_DiscountCode.dart';

class PaymentPageViewBody extends StatefulWidget {
  const PaymentPageViewBody({super.key}); // Use Key? for optional keys

  @override
  // ignore: library_private_types_in_public_api
  _PaymentPageViewBodyState createState() => _PaymentPageViewBodyState();
}

class _PaymentPageViewBodyState extends State<PaymentPageViewBody> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 10),
              _buildPaymentContainers(), // Created a method to encapsulate payment containers
              const SizedBox(height: 30),
              buildDiscountCodeSection(),
              const SizedBox(height: 30),
              buildOrderSummary(),
              const SizedBox(height: 30),
              CustomButtom(
                onPtrssed: () {
                  Navigator.pushNamed(context, SuccessorderPageview.routeName);
                }, // Corrected method name
                text: 'تأكيد الطلب',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentContainers() {
    return Column(
      children: [
        PaymentContainer(
          images: const [
            Assets.assetsAssetsImagesVisa,
            Assets.assetsAssetsImagesMada,
            Assets.assetsAssetsImagesMaster,
          ],
          title: 'الدفع الالكتروني',
          icon: const Icon(
            Icons.payment,
            size: 20,
            color: AppColors.primaryColor,
          ),
          value: 'electronic',
          groupValue: selectedPaymentMethod,
          onChanged: (value) => setState(() {
            selectedPaymentMethod = value;
          }),
        ),
        const SizedBox(height: 20),
        PaymentContainer(
          title: '',
          images: const [
            Assets.assetsAssetsImagesStc,
          ],
          icon: const Icon(
            Icons.phone_iphone,
            size: 20,
            color: AppColors.primaryColor,
          ),
          value: 'stcPay',
          groupValue: selectedPaymentMethod,
          onChanged: (value) => setState(() {
            selectedPaymentMethod = value;
          }),
        ),
      ],
    );
  }

  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          'اختر طريقة الدفع',
          style: AppTextStyle.ffShamelBold16.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}

class PaymentMethodOption extends StatelessWidget {
  final String title;
  final List<String> images;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const PaymentMethodOption({
    super.key,
    required this.title,
    required this.images,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.6),
                blurRadius: 6,
                spreadRadius: 3,
                offset: const Offset(0, 3),
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.6),
                blurRadius: 6,
                spreadRadius: 3,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 15),
        Text(
          title,
          style: AppTextStyle.ffShamelBold16,
        ),
        const SizedBox(width: 10),
        ...images.map((image) => Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(image,
                  width: 40, height: 20), // Ensure correct aspect ratio
            )),
      ],
    );
  }
}
