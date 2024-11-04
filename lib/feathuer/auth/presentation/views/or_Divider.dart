import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: Divider(
          color: Color(0xffDDDFDF),
        )),
        SizedBox(
          width: 18,
        ),
        Text(
          'أو',
          style: AppTextStyle.ffShamelRegular16,
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(child: Divider(color: Color(0xffDDDFDF)))
      ],
    );
  }
}
