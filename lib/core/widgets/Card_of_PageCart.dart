import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';

class CartCard extends StatefulWidget {
  const CartCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  String selectedCount = '1'; // القيمة الافتراضية للكمية
  String selectedSize = 'XL'; // القيمة الافتراضية للمقاس

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _buildProductImage(),
          const SizedBox(width: 10),
          Expanded(
            child: _buildCartItemDetails(),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(Assets.assetsAssetsImagesWatermelonPng),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildCartItemDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCartItemHeader(),
        const SizedBox(height: 5),
        Text(
          'جاكت مبطن فرو من احسن الخامات واستخدام احسن الماكينات للصناعة',
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        const SizedBox(height: 5),
        _buildSizeAndColorButtons(),
      ],
    );
  }

  Widget _buildCartItemHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'جاكت',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF512F61)),
        ),
        Row(
          children: [
            const Text('20 ريال',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(width: 10),
            Image.asset(Assets.assetsAssetsImagesDeleteButton,
                width: 30, height: 30),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeAndColorButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildSizeButton(),
        const SizedBox(width: 10),
        _buildColorButton(),
        const SizedBox(width: 10),
        _buildCounttyButton(),
      ],
    );
  }

  Widget _buildSizeButton() {
    List<String> sizeOptions = ['S', 'M', 'L', 'XL', 'XXL']; // خيارات المقاس

    return Container(
      width: 50,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.29),
              offset: const Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 1),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton<String>(
        value: selectedSize,
        underline: const SizedBox(),
        icon: const SizedBox.shrink(), // إزالة السهم
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              selectedSize = newValue;
            });
          }
        },
        items: sizeOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(
              // محاذاة النص في المنتصف
              child: Text(
                value,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          );
        }).toList(),
        isExpanded: true,
      ),
    );
  }

  Widget _buildCounttyButton() {
    List<String> countOptions =
        List.generate(10, (index) => (index + 1).toString());

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.29),
              offset: const Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 1),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton<String>(
        value: selectedCount,
        underline: const SizedBox(),
        icon: const SizedBox.shrink(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              selectedCount = newValue;
            });
          }
        },
        items: countOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
          );
        }).toList(),
        isExpanded: true,
      ),
    );
  }

  Widget _buildColorButton() {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
