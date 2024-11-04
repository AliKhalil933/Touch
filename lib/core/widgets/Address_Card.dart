import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class AddressCard extends StatelessWidget {
  final String city;
  final String address;
  final String landmark;
  final String buildingNumber;
  final String phone;
  final VoidCallback onDelete;
  final VoidCallback onSelect;

  const AddressCard({
    super.key,
    required this.city,
    required this.address,
    required this.landmark,
    required this.buildingNumber,
    required this.phone,
    required this.onDelete,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  city,
                  style: AppTextStyle.ffShamelBold16.copyWith(fontSize: 18),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: onDelete,
                    ),
                    IconButton(
                      icon: const Icon(Icons.check_circle_outline,
                          color: Colors.green),
                      onPressed: onSelect,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              address,
              style:
                  AppTextStyle.ffShamelBold16.copyWith(color: Colors.black54),
            ),
            Text(
              'علامة مميزة: $landmark',
              style:
                  AppTextStyle.ffShamelBold16.copyWith(color: Colors.black54),
            ),
            Text(
              'رقم المبنى: $buildingNumber',
              style:
                  AppTextStyle.ffShamelBold16.copyWith(color: Colors.black54),
            ),
            const SizedBox(height: 8),
            Text(
              phone,
              style: AppTextStyle.ffShamelBold16.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
