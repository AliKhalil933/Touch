import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/feathuer/AddressHomePage/presentation/views/Address_Home.dart';

class AddressSection extends StatefulWidget {
  final Function(Map<String, String>) onAddressSelected;

  const AddressSection({super.key, required this.onAddressSelected});

  @override
  _AddressSectionState createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> {
  Map<String, String>? selectedAddress;
  String addressMessage = 'يرجى اختيار العنوان'; // رسالة افتراضية

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.location_on, color: Colors.purple),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                children: [
                  Text('عنوان التوصيل',
                      style: AppTextStyle.ffShamelBold16
                          .copyWith(color: AppColors.primaryColor)),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      final selectedLocation = await Navigator.pushNamed(
                          context, AddressPageView.routeName);
                      if (selectedLocation is Map<String, String>) {
                        setState(() {
                          selectedAddress = selectedLocation;
                          addressMessage = 'تم اختيار العنوان'; // تحديث الرسالة
                        });
                        widget.onAddressSelected(selectedAddress!);
                      }
                    },
                    child: Text('إختر عنوان',
                        style: AppTextStyle.ffShamelBold16
                            .copyWith(color: AppColors.lightprimaryColor)),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () async {
            final selectedLocation =
                await Navigator.pushNamed(context, AddressPageView.routeName);
            if (selectedLocation is Map<String, String>) {
              setState(() {
                selectedAddress = selectedLocation;
                addressMessage = 'تم اختيار العنوان'; // تحديث الرسالة
              });
              widget.onAddressSelected(selectedAddress!);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3)),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedAddress?['address'] ?? addressMessage,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const Icon(Icons.arrow_forward_ios,
                    color: AppColors.primaryColor),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
