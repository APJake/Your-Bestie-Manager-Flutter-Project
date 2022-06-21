import 'package:flutter/material.dart';
import 'package:ybc_manager/utils/app_color.dart';

class MySnackBar extends StatelessWidget {
  final String message;
  final SnackBarAction? action;
  final Color backgroundColor;
  final Color color;
  final double horizontalPadding;
  const MySnackBar({
    Key? key,
    required this.message,
    this.action,
    this.backgroundColor = AppColor.primaryColor,
    this.color = AppColor.error,
    this.horizontalPadding = 10.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
        action: action,
        content: Text(message),
        duration: const Duration(milliseconds: 1500),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, // Inner padding for SnackBar content.
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ));
  }
}
