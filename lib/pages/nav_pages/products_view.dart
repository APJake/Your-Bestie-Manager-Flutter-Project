import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ybc_manager/pages/add_product_page.dart';
import 'package:ybc_manager/pages/items_page.dart';
import 'package:ybc_manager/widgets/big_text.dart';
import 'package:ybc_manager/widgets/my_chip.dart';
import 'package:ybc_manager/widgets/small_text.dart';
import 'package:ybc_manager/widgets/specials/filter_chips_modal.dart';

import '../../bloc/products/get/cubit/get_products_cubit.dart';
import '../../data/models/product.dart';
import '../../utils/app_color.dart';
import '../../utils/app_dimension.dart';
import '../../widgets/text_with_icon.dart';

import '../../utils/custom_extensions.dart';

class ProductsView extends StatefulWidget {
  ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  int _currentIndex = 0;

  _showFilter() {
    showBarModalBottomSheet(
      context: context,
      expand: true,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: FilterChipsModal(
          items: ["A001", "A002", "B002", "C008", "D012"],
        ),
      ),
    );
  }

  _tabbar() => Container(
        width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.tabColor,
        ),
        child: GNav(
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            rippleColor:
                AppColor.primaryColor, // tab button ripple color when pressed
            hoverColor: AppColor.primaryColor, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 30,
            curve: Curves.easeOutExpo, // tab animation curves
            duration: Duration(milliseconds: 200), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: AppColor.hintColor, // unselected icon color
            activeColor: AppColor.primaryColor, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor:
                AppColor.backgroundColor, // selected tab background color
            padding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 5), // navigation bar padding
            tabs: const [
              GButton(
                icon: Icons.check_circle,
                text: 'available',
              ),
              GButton(
                icon: Icons.access_time,
                text: 'waiting',
              ),
              GButton(
                icon: Icons.shopping_bag,
                text: 'packing',
              ),
            ]),
      );

  _header() => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BigText(
              text: "Items",
              size: AppDimension.xBigFont,
              color: AppColor.primaryColor,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => ItemsPage())));
                },
                icon: const Icon(
                  Icons.grid_view_rounded,
                  color: AppColor.primaryColor,
                ))
          ],
        ),
      );

  _chips() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        width: double.infinity,
        child: Wrap(
          spacing: 4,
          alignment: WrapAlignment.start,
          children: [
            MyChip(text: "A003", onDeleted: () {}),
            MyChip(text: "A003", onDeleted: () {}),
            MyChip(text: "A003", onDeleted: () {}),
            MyChip(text: "A3", onDeleted: () {}),
            MyChip(text: "A003", onDeleted: () {}),
            IconButton(
                onPressed: () {
                  _showFilter();
                },
                icon: Icon(
                  Icons.add_circle_outline_rounded,
                  size: 30,
                  color: AppColor.primaryColor,
                ))
          ],
        ),
      );

  _error(String message) => Column(
        children: [
          SmallText(
            text: message,
            color: AppColor.error,
            size: 15,
          ),
          TextButton(
              onPressed: () {},
              child: SmallText(
                text: "Refresh",
              ))
        ],
      );

  _productItem(Product product) => Container(
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
                  Expanded(
                    child: BigText(
                      text:
                          "${product.prefix} - ${product.codeNo} (${product.type})",
                      size: AppDimension.xNormalFont,
                    ),
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
                              text: product.price.toPriceString(),
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

  _items(List<Product> products) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (_, index) => _productItem(products[index])),
      );

  _body() => Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _header(),
                _tabbar(),
                _chips(),
                BlocBuilder<GetProductsCubit, GetProductsState>(
                  builder: (context, state) {
                    if (state is GetProductsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GetProductsSuccess) {
                      return _items(state.products);
                    } else if (state is GetProductsFail) {
                      return _error(state.error);
                    }
                    return _error("Something went wrong");
                  },
                )
              ],
            ),
          ),
          Positioned(
            bottom: 84,
            right: 24,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddProductPage()));
              },
              child: Icon(Icons.add),
              backgroundColor: AppColor.primaryColor,
            ),
          )
        ],
      );
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetProductsCubit>(context).getProducts();
    return SafeArea(
      bottom: false,
      child: SizedBox(height: double.infinity, child: _body()),
    );
  }
}
