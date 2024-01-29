// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customeicon extends StatelessWidget {
  customeicon({
    this.sizes,
    required this.Iconss,
    this.colorss,
    super.key,
  });
  final Iconss;
  double? sizes;
  Color? colorss;
  @override
  Widget build(BuildContext context) {
    return Icon(
      Iconss,
      size: sizes,
      color: colorss ?? Colors.black,
    );
  }
}