import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_project/core/utils/App_Constants.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/core/utils/App_Colors.dart'; // إذا كنت تستخدم الألوان من ملف معين

class ComplaintsPageview extends StatefulWidget {
  const ComplaintsPageview({super.key});
  static const routeName = "ComplaintsPageview";

  @override
  _ComplaintsPageviewState createState() => _ComplaintsPageviewState();
}

class _ComplaintsPageviewState extends State<ComplaintsPageview> {
  String? selectedFileName;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFileName = result.files.single.name;
      });
    } else {
      // المستخدم ألغى اختيار الملف
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: '(الادارة)'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AppConstants.logoPath,
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 20),

              // صندوق يحتوي على الرسالة أو المحادثة
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 300,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      'لا يوجد محادثات',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // TextField لإدخال النص وزرار إرفاق الملفات وإرسال الرسالة
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'اكتب رسالتك',
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // زرار إرفاق الملفات
                    IconButton(
                      icon: const Icon(Icons.attach_file,
                          color: AppColors.primaryColor),
                      onPressed: pickFile, // استدعاء دالة إرفاق الملفات
                    ),

                    const SizedBox(width: 8),

                    // زرار إرسال الرسالة
                    CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: () {
                          // Action to send message
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // عرض اسم الملف المختار
              if (selectedFileName != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text('الملف المختار: $selectedFileName'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
