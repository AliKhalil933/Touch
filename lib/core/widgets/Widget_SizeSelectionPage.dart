import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class SizeSelectionPage extends StatefulWidget {
  static const routeName = 'sizeselectionpage';

  const SizeSelectionPage({super.key});

  @override
  _SizeSelectionPageState createState() => _SizeSelectionPageState();
}

class _SizeSelectionPageState extends State<SizeSelectionPage> {
  int? selectedIndex; // متغير لتخزين السطر المحدد

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "مقاسات خاصة",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Headers row
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('المقاس',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('الطول',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('العرض',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('الرقبة',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            // List of sizes
            Expanded(
              child: ListView.builder(
                itemCount: 6, // Number of rows
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // تحديث السطر المحدد
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0), // مسافة بين الأسطر
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Colors.orange[100]
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: selectedIndex == index
                                ? Colors.orange
                                : Colors.grey[300] ?? Colors.grey,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _sizeButton(context, index == 0 ? '3XL' : '4XL',
                                  selectedIndex == index),
                              _sizeText('88'),
                              _sizeText('100'),
                              _sizeText('30'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Confirm button
            ElevatedButton(
              onPressed: selectedIndex != null
                  ? () {
                      Navigator.pop(context, selectedIndex);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3E1B44), // Custom color
                minimumSize: const Size(double.infinity, 50), // Full width
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded button
                ),
              ),
              child: Text('تأكيد',
                  style: AppTextStyle.ffShamelRegular16
                      .copyWith(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sizeButton(BuildContext context, String size, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.orange : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected ? Colors.orange : Colors.grey[300]!,
        ),
      ),
      child: Text(
        size,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: selected ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  // Widget for displaying the size text
  Widget _sizeText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16),
    );
  }
}
