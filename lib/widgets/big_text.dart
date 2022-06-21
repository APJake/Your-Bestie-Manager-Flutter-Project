import 'package:flutter/material.dart';
import 'package:ybc_manager/utils/app_color.dart';
import 'package:ybc_manager/utils/app_dimension.dart';

class BigText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final TextOverflow overflow;
  final int maxLines;
  final FontWeight fontWeight;
  const BigText({
    Key? key,
    required this.text,
    this.color = AppColor.primaryColor,
    this.size = AppDimension.bigFont,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight),
    );
  }
}
