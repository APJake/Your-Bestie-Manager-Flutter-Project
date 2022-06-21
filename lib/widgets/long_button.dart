import 'package:flutter/material.dart';
import 'package:ybc_manager/utils/app_color.dart';
import 'package:ybc_manager/widgets/text_with_icon.dart';

class LongButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color backgroundColor;
  final Color color;
  final bool isLoading;
  final VoidCallback onPress;
  const LongButton({
    Key? key,
    required this.onPress,
    required this.text,
    this.icon,
    this.backgroundColor = AppColor.primaryColor,
    this.color = AppColor.colorOnPrimary,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: color,
                ))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            icon,
                            color: color,
                          ),
                        ),
                  Text(
                    text,
                    style: TextStyle(color: color, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
        onPressed: onPress,
      ),
    );
  }
}
