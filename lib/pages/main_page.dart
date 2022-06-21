import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ybc_manager/pages/nav_pages/dashboard_view.dart';
import 'package:ybc_manager/pages/nav_pages/products_view.dart';
import 'package:ybc_manager/pages/nav_pages/orders_view.dart';
import 'package:ybc_manager/pages/nav_pages/settings_view.dart';
import 'package:ybc_manager/pages/nav_pages/users_page.dart';
import 'package:ybc_manager/utils/app_color.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List pages = [
    DashboardView(),
    OrdersView(),
    ProductsView(),
    UsersPage(),
    SettingsView(),
  ];

  onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColor.backgroundColor,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(
            Icons.dashboard,
            size: 30,
            color: AppColor.primaryColor,
          ),
          Icon(Icons.shopping_cart, size: 30, color: AppColor.primaryColor),
          Icon(Icons.checkroom, size: 30, color: AppColor.primaryColor),
          Icon(Icons.people, size: 30, color: AppColor.primaryColor),
          Icon(Icons.settings, size: 30, color: AppColor.primaryColor),
        ],
        color: AppColor.navColor,
        buttonBackgroundColor: AppColor.navColor,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: onTap,
        letIndexChange: (index) => true,
      ),
      body: pages[_currentIndex],
    );
  }
}
