import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/Custom_Buttom.dart';
import 'package:flutter_project/feathuer/Payment/presentation/views/Payment_Page_View.dart';

class PurchaseButton extends StatelessWidget {
  const PurchaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButtom(
        onPtrssed: () {
          Navigator.pushNamed(context, PaymentPageView.routeName);
        },
        text: 'شراء');
  }
}
