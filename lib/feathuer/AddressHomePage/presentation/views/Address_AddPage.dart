import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/Custom_Text_Feild.dart';
import 'package:flutter_project/core/widgets/custom_Buttom_Small.dart';
import 'package:flutter_project/feathuer/AddressHomePage/presentation/views/Page_Map_View.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class AddressAddPageView extends StatefulWidget {
  const AddressAddPageView({super.key});
  static const routeName = 'AddressAddPage';

  @override
  _AddressAddPageViewState createState() => _AddressAddPageViewState();
}

class _AddressAddPageViewState extends State<AddressAddPageView> {
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _landmarkController =
      TextEditingController(); // العلامة المميزة
  final TextEditingController _buildingNumberController =
      TextEditingController(); // رقم المبنى
  final TextEditingController _mapAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة عنوان جديد'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                hintText: 'المدينة',
                textInputType: TextInputType.name,
                controller: _cityController,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'العنوان',
                textInputType: TextInputType.name,
                controller: _addressController,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'علامة مميزة', // التعديل هنا
                textInputType: TextInputType.name,
                controller: _landmarkController,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'اسم أو رقم المبنى', // التعديل هنا
                textInputType: TextInputType.name,
                controller: _buildingNumberController,
              ),
              const SizedBox(height: 16),
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
                  hintText: 'العنوان على الخريطة',
                  textInputType: TextInputType.name,
                  controller: _mapAddressController,
                  enabled: false,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: customButtonSmall(
                  onPressed: () {
                    final addressOnMap = _mapAddressController.text;
                    if (addressOnMap.isNotEmpty) {
                      // إعداد البيانات مع العلامة المميزة ورقم المبنى
                      Map<String, String> newAddress = {
                        'city': _cityController.text,
                        'address': _addressController.text,
                        'landmark': _landmarkController.text, // العلامة المميزة
                        'buildingNumber':
                            _buildingNumberController.text, // رقم المبنى
                        'mapAddress': addressOnMap,
                      };
                      Navigator.pop(context, newAddress); // إرجاع العنوان
                    } else {
                      _showErrorDialog('يرجى إدخال العنوان على الخريطة.');
                    }
                  },
                  title: 'حفظ',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('خطأ'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('موافق'),
            ),
          ],
        );
      },
    );
  }
}
