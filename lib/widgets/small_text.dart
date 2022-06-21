import 'package:flutter/material.dart';
import 'package:ybc_manager/utils/app_color.dart';
import 'package:ybc_manager/utils/app_dimension.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  const SmallText({
    Key? key,
    required this.text,
    this.color = AppColor.hintColor,
    this.size = AppDimension.smallFont,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(fontSize: size, color: color),
    );
  }
}
