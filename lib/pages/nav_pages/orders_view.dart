import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ybc_manager/utils/app_color.dart';
import 'package:ybc_manager/utils/app_dimension.dart';
import 'package:ybc_manager/widgets/big_text.dart';
import 'package:ybc_manager/widgets/text_with_icon.dart';
import 'package:ybc_manager/widgets/small_text.dart';

class OrdersView extends StatefulWidget {
  OrdersView({Key? key}) : super(key: key);

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  _header() => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BigText(
              text: "Orders",
              size: AppDimension.xBigFont,
              color: AppColor.primaryColor,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.grid_view_rounded,
                  color: AppColor.primaryColor,
                ))
          ],
        ),
      );

  _tabbar() => Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.tabColor,
        ),
        child: const GNav(
            rippleColor:
                AppColor.primaryColor, // tab button ripple color when pressed
            hoverColor: AppColor.primaryColor, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 30,
            curve: Curves.easeOutExpo, // tab animation curves
            duration:
                const Duration(milliseconds: 200), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: AppColor.hintColor, // unselected icon color
            activeColor: AppColor.primaryColor, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor:
                AppColor.backgroundColor, // selected tab background color
            padding: EdgeInsets.symmetric(
                horizontal: 12, vertical: 5), // navigation bar padding
            tabs: [
              GButton(
                icon: Icons.access_time,
                text: 'waiting',
              ),
              GButton(
                icon: Icons.shopping_bag,
                text: 'packing',
              ),
              GButton(
                icon: Icons.delivery_dining,
                text: 'delivering',
              ),
              GButton(
                icon: Icons.home,
                text: 'completed',
              )
            ]),
      );

  _orderItem(index) => Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.navColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    color: AppColor.shadow, offset: Offset(0, 1), blurRadius: 3)
              ]),
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: "Aung Minn Khant",
                    size: AppDimension.xNormalFont,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: AppColor.primaryColor,
                      )),
                ],
              ),
              Row(
                children: [
                  SmallText(
                    text: "#103",
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.circle, size: 7),
                  const SizedBox(width: 10),
                  SmallText(
                    text: "1 day ago",
                    color: AppColor.success,
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.circle, size: 7),
                  const SizedBox(width: 10),
                  TextWithIcon(
                    text: "3",
                    icon: Icons.close,
                    backgroundColor: AppColor.secondaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  TextWithIcon(
                    text: "packing",
                    icon: Icons.shopping_bag,
                    backgroundColor: AppColor.primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    radius: 30,
                  ),
                  const SizedBox(width: 6),
                  TextWithIcon(
                    text: "cash",
                    backgroundColor: AppColor.backgroundColor,
                    color: AppColor.primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    radius: 30,
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextWithIcon(
                              text: "13500",
                              icon: Icons.check,
                              backgroundColor: Colors.transparent,
                              color: AppColor.primaryColor,
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      );

  _orders() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.only(bottom: 20),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: ((context, index) {
            return _orderItem(index);
          }),
        ),
      );

  _orderBody() => Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                _header(),
                _tabbar(),
                _orders(),
              ],
            ),
          ),
          Positioned(
            bottom: 84,
            right: 24,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add_shopping_cart),
              backgroundColor: AppColor.primaryColor,
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(height: double.infinity, child: _orderBody()),
    );
  }
}
