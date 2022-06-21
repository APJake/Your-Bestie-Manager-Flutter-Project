import 'package:flutter/material.dart';
import 'package:ybc_manager/utils/app_color.dart';
import 'package:ybc_manager/utils/app_dimension.dart';
import 'package:ybc_manager/widgets/big_text.dart';

class TextWithIcon extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color color;
  final Color backgroundColor;
  final double size;
  final double space;
  final EdgeInsets padding;
  final double radius;
  const TextWithIcon({
    Key? key,
    required this.text,
    this.icon,
    this.color = AppColor.colorOnPrimary,
    this.backgroundColor = AppColor.primaryColor,
    this.size = AppDimension.smallFont,
    this.space = 5,
    this.radius = 10,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(radius)),
      padding: padding,
      child: Row(
        children: [
          icon == null
              ? Container()
              : Icon(
                  icon,
                  color: color,
                  size: size + 3,
                ),
          SizedBox(width: space),
          BigText(
            text: text,
            color: color,
            size: size,
          )
        ],
      ),
    );
  }
}
