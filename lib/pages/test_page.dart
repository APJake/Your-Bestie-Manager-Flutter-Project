import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc_manager/bloc/products/get/cubit/get_products_cubit.dart';
import 'package:ybc_manager/widgets/specials/product_view.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetProductsCubit>(context).getProducts();
    return Scaffold(
        appBar: AppBar(title: Text("test")),
        body: BlocBuilder<GetProductsCubit, GetProductsState>(
          builder: (context, state) {
            if (state is GetProductsSuccess) {
              var products = state.products;
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: ((context, index) {
                    return ProductView(products[index]);
                  }));
            } else if (state is GetProductsFail) {
              return Center(child: Text(state.error));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
