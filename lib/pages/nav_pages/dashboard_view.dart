import 'package:flutter/material.dart';
import 'package:ybc_manager/utils/app_color.dart';
import 'package:ybc_manager/utils/app_dimension.dart';
import 'package:ybc_manager/utils/w_position.dart';
import 'package:ybc_manager/widgets/big_text.dart';
import 'package:ybc_manager/widgets/shaped_container.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  _dashboard() => Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const BigText(
                text: "Dashboard",
                size: AppDimension.xBigFont,
                color: AppColor.primaryColor),
            const SizedBox(height: 20),
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ShapedContainer(
                      body: "body1",
                      cornerPosition: WPosition.topLeft,
                      title: "Orders",
                      fooder: "this is a fooder",
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ShapedContainer(
                      body: "body2",
                      cornerPosition: WPosition.topRight,
                      fooder: "this is a fooder",
                      title: "Orders",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ShapedContainer(
                      body: "body3",
                      cornerPosition: WPosition.bottomLeft,
                      fooder: "this is another fooder with long text",
                      title: "this is long title",
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ShapedContainer(
                        body: "body4", cornerPosition: WPosition.bottomRight),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _dashboard(),
    );
  }
}
