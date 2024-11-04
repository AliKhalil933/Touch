import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/Address_Card.dart';
import 'package:flutter_project/core/widgets/Card_of_PageCart.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/feathuer/Cart/presentation/views/Build_Adress_Section.dart';
import 'package:flutter_project/feathuer/Cart/presentation/views/PurchaseButton.dart';
import 'package:flutter_project/feathuer/Cart/presentation/views/build_Order_Summary.dart';

class CartPageview extends StatefulWidget {
  static const String routeName = 'cartPageView';

  const CartPageview({super.key});

  @override
  State<CartPageview> createState() => _CartPageviewState();
}

class _CartPageviewState extends State<CartPageview> {
  Map<String, String>? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: BuildAppBar(context, Title: 'السلة'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const CartCard(),
            const SizedBox(height: 30),
            OrderSummary(),
            const SizedBox(height: 50),
            AddressSection(onAddressSelected: (address) {
              setState(() {
                selectedAddress = address;
              });
            }),
            const SizedBox(height: 20),
            if (selectedAddress != null)
              AddressCard(
                city: selectedAddress!['city']!,
                address: selectedAddress!['address']!,
                landmark: selectedAddress!['landmark']!,
                buildingNumber: selectedAddress!['buildingNumber']!,
                phone: selectedAddress!['phone']!,
                onDelete: () {
                  // Handle delete
                },
                onSelect: () {
                  // Handle select
                },
              )
            else
              const PurchaseButton(),
          ],
        ),
      ),
    );
  }
}
