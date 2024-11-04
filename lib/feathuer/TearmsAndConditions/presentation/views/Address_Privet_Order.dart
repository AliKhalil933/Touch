import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/core/widgets/Custom_Buttom.dart';
import 'package:flutter_project/core/widgets/Custom_Text_Feild.dart';
import 'package:flutter_project/feathuer/AddressHomePage/presentation/views/Page_Map_View.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressPagePrivetOrder extends StatefulWidget {
  static const routeName = 'AddressPagePrivetOrder';

  const AddressPagePrivetOrder({super.key});

  @override
  State<AddressPagePrivetOrder> createState() => _AddressPagePrivetOrderState();
}

class _AddressPagePrivetOrderState extends State<AddressPagePrivetOrder> {
  final TextEditingController _mapAddressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'طلب خاص'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'إختر العنوان',
                  style: AppTextStyle.ffShamelBold16
                      .copyWith(color: AppColors.lightprimaryColor),
                ),
                const SizedBox(width: 10),
                Text(
                  'عنوان التوصيل',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: const Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Icon(Icons.location_pin,
                    color: AppColors.primaryColor, size: 30),
              ],
            ),
            const SizedBox(height: 10),
            // CustomTextFormField with correct closing
            GestureDetector(
              onTap: () async {
                final selectedLocation = await Navigator.pushNamed(
                  context,
                  PageMapView.routeName,
                );

                if (selectedLocation is LatLng) {
                  _mapAddressController.text =
                      '(${selectedLocation.latitude}, ${selectedLocation.longitude})';

                  List<Placemark> placemarks = await placemarkFromCoordinates(
                    selectedLocation.latitude,
                    selectedLocation.longitude,
                  );

                  if (placemarks.isNotEmpty) {
                    setState(() {
                      _cityController.text = placemarks[0].locality ?? '';
                      _addressController.text =
                          '${placemarks[0].street}, ${placemarks[0].subLocality}';
                    });
                  }
                }
              },
              child: CustomTextFormField(
                hintText: '  برجاء أختيار العنوان علي الخريطة',
                textInputType: TextInputType.name,
                controller: _mapAddressController,
                enabled: false,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'عنوان',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Another TextField with 3D effect
            const CustomTextFormField(
                hintText: 'عنوان طلبك', textInputType: TextInputType.name),
            const SizedBox(height: 20),
            Text(
              'وصف المنتج',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // TextField for product description with 3D effect
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'تفاصيل المنتج',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                maxLines: 5,
              ),
            ),
            const SizedBox(height: 30),
            // Elevated button with 3D effect
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: CustomButtom(onPtrssed: () {}, text: 'تأكيد الطلب'),
            ),
          ],
        ),
      ),
    );
  }
}
