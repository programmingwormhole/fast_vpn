// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Gap extends StatelessWidget {

  final double? height;
  final double? width;

  const Gap([this.height, this.width]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
