import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/widgets/Notificition_Card.dart';

class NotificationPageViewBody extends StatelessWidget {
  const NotificationPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
          horizontal: KHorizontalPadding, vertical: 10),
      itemBuilder: (context, index) {
        return const NotificationCard();
      },
      itemCount: 5,
      physics: const AlwaysScrollableScrollPhysics(),
    );
  }
}
