import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/feathuer/Payment/presentation/views/Payment_page_view_Body.dart';

class PaymentPageView extends StatelessWidget {
  const PaymentPageView({super.key});
  static const routeName = 'PaymentPageView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'الدفع'),
      body: const SafeArea(child: PaymentPageViewBody()),
    );
  }
}
