import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar BuildAppBar(BuildContext context, {required String Title}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Text(
      Title,
      style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
    ),
  );
}
