import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/feathuer/OrderPage/presentation/views/OrderPage_view_Body.dart';

class OrderPageView extends StatelessWidget {
  const OrderPageView({super.key});
  static const String routeName = 'OrderPageView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'طلباتي'),
      body: SafeArea(child: OrderPageViewBody()),
    );
  }
}
