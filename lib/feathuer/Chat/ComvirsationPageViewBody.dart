import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';

class ChatPageViewBody extends StatelessWidget {
  const ChatPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              '11-10-2022',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildMessage(
                  message: 'السلام عليكم',
                  isSender: true,
                  time: '4:14 pm',
                  senderIcon: Assets.assetsAssetsImagesSupportAgent,
                ),
                _buildMessage(
                  message: 'يتم التواصل معك يرجاء اخبارنا بمشكلتك',
                  isSender: false,
                  time: '4:14 pm',
                  senderIcon: Assets.assetsAssetsImagesSupportAgent,
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessage({
    required String message,
    required bool isSender,
    required String time,
    required String senderIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSender)
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
              child: Image.asset(senderIcon),
            ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSender ? Colors.purple[100] : Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            constraints: const BoxConstraints(maxWidth: 250),
            child: Column(
              crossAxisAlignment:
                  isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 5),
                Text(
                  time,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
          if (isSender) const SizedBox(width: 8),
          if (isSender)
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
              child: Image.asset(senderIcon),
            ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
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
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 24,
            height: 24,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: Image.asset(Assets.assetsAssetsImagesAttatchments),
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {}
              },
            ),
          ),
          const SizedBox(width: 8),
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
    );
  }
}
