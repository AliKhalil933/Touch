import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/feathuer/AddressHomePage/presentation/views/Address_AddPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressPageView extends StatefulWidget {
  const AddressPageView({super.key});
  static const routeName = 'AddressesPage';

  @override
  _AddressPageViewState createState() => _AddressPageViewState();
}

class _AddressPageViewState extends State<AddressPageView> {
  List<Map<String, String>> addresses = [];

  @override
  void initState() {
    super.initState();
    _loadAddresses(); // Load addresses when the page starts
  }

  Future<void> _loadAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? addressList = prefs.getStringList('addresses');

    if (addressList != null) {
      setState(() {
        addresses = addressList
            .map((address) => Map<String, String>.from(json.decode(address)))
            .toList();
      });
    }
  }

  Future<void> _saveAddress() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> addressList =
        addresses.map((address) => json.encode(address)).toList();
    await prefs.setStringList('addresses', addressList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('العناوين'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          addresses.isEmpty ? _buildEmptyState() : _buildAddressListView(),
          _buildAddAddressButton(),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'عفواً،',
            style: AppTextStyle.ffShamelBold16
                .copyWith(color: AppColors.primaryColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'لا توجد عناوين مضافة',
            style: AppTextStyle.ffShamelBold16
                .copyWith(color: AppColors.primaryColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAddressListView() {
    return ListView.builder(
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        final address = addresses[index];
        return Card(
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildAddressDetails(address),
                ),
                _buildAddressActions(index),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddressDetails(Map<String, String> address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          address['city']!,
          style: AppTextStyle.ffShamelBold16.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          address['address']!,
          style: AppTextStyle.ffShamelBold10.copyWith(
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'علامة مميزة: ${address['landmark'] ?? 'غير متوفر'}',
          style: AppTextStyle.ffShamelBold10.copyWith(
            color: Colors.black54,
          ),
        ),
        Text(
          'رقم المبنى: ${address['buildingNumber'] ?? 'غير متوفر'}',
          style: AppTextStyle.ffShamelBold10.copyWith(
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildAddressActions(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              addresses.removeAt(index);
            });
            _saveAddress();
          },
          child: Image.asset(
            Assets.assetsAssetsImagesDeleteAddress,
            width: 100,
            height: 50,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.pop(context,
                '${addresses[index]['city']}, ${addresses[index]['address']}');
          },
          child: Image.asset(
            Assets.assetsAssetsImagesDoneButton,
            width: 100,
            height: 50,
          ),
        ),
      ],
    );
  }

  Widget _buildAddAddressButton() {
    return Positioned(
      bottom: 16,
      left: 16,
      child: GestureDetector(
        onTap: () async {
          final newAddress =
              await Navigator.pushNamed(context, AddressAddPageView.routeName)
                  as Map<String, String>?;

          if (newAddress != null) {
            setState(() {
              addresses.add(newAddress);
              _saveAddress();
            });
          }
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.all(16),
          child: Image.asset(
            Assets.assetsAssetsImagesPlus,
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
