import 'package:flutter/material.dart';
import 'package:ybc_manager/utils/app_color.dart';
import 'package:ybc_manager/utils/app_dimension.dart';
import 'package:ybc_manager/utils/w_position.dart';
import 'package:ybc_manager/widgets/big_text.dart';
import 'package:ybc_manager/widgets/small_text.dart';

class ShapedContainer extends StatelessWidget {
  final Color color;
  final String? title;
  final String body;
  final String? fooder;
  final WPosition cornerPosition;
  final double height;
  const ShapedContainer({
    Key? key,
    required this.body,
    this.color = AppColor.navColor,
    required this.cornerPosition,
    this.fooder,
    this.title,
    this.height = 120,
  }) : super(key: key);

  _isLeft(position) =>
      cornerPosition == WPosition.topLeft ||
      cornerPosition == WPosition.bottomLeft;
  _isRight(position) =>
      cornerPosition == WPosition.topRight ||
      cornerPosition == WPosition.bottomRight;

  _getRadius(position) => (cornerPosition == position)
      ? const Radius.circular(50)
      : const Radius.circular(10);

  _getMargin(pos1, pos2) =>
      (cornerPosition == pos1 || cornerPosition == pos2) ? 5.0 : 0.0;

  _getAxisAlignment() => (cornerPosition == WPosition.topLeft ||
          cornerPosition == WPosition.bottomLeft)
      ? CrossAxisAlignment.end
      : CrossAxisAlignment.start;

  _getPadding() => EdgeInsets.only(
      left: _isLeft(cornerPosition) ? 30 : 12,
      right: _isRight(cornerPosition) ? 30 : 12);

  _shape() => Container(
        margin: EdgeInsets.only(
          left: _getMargin(WPosition.topRight, WPosition.bottomRight),
          right: _getMargin(WPosition.topLeft, WPosition.bottomLeft),
          top: _getMargin(WPosition.bottomLeft, WPosition.bottomRight),
          bottom: _getMargin(WPosition.topLeft, WPosition.topRight),
        ),
        height: height,
        decoration: BoxDecoration(
          color: AppColor.navColor,
          borderRadius: BorderRadius.only(
            topLeft: _getRadius(WPosition.topLeft),
            topRight: _getRadius(WPosition.topRight),
            bottomLeft: _getRadius(WPosition.bottomLeft),
            bottomRight: _getRadius(WPosition.bottomRight),
          ),
        ),
        child: Padding(
          padding: _getPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallText(
                text: title ?? "",
                color: AppColor.textColor,
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: BigText(
                    text: body,
                    color: AppColor.primaryColor,
                  )),
              SmallText(
                text: fooder ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return _shape();
  }
}
