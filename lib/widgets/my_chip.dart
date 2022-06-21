import 'package:flutter/material.dart';
import 'package:ybc_manager/utils/app_color.dart';
import 'package:ybc_manager/utils/app_dimension.dart';
import 'package:ybc_manager/widgets/small_text.dart';

class MyChip extends StatelessWidget {
  final String text;
  final VoidCallback onDeleted;
  final IconData? icon;
  final Color color;
  final Color backgroundColor;
  final double size;
  const MyChip({
    Key? key,
    required this.text,
    required this.onDeleted,
    this.icon,
    this.color = AppColor.primaryColor,
    this.backgroundColor = AppColor.navColor,
    this.size = AppDimension.normalFont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: SmallText(
        text: text,
        size: size,
        color: color,
      ),
      backgroundColor: backgroundColor,
      deleteIcon: Icon(
        Icons.close,
        size: size + 3,
      ),
      deleteIconColor: color,
      onDeleted: onDeleted,
    );
  }
}
