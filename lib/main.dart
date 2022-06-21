import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc_manager/bloc/products/get/cubit/get_products_cubit.dart';
import 'package:ybc_manager/module.dart';
import 'package:ybc_manager/pages/login_page.dart';
import 'package:ybc_manager/pages/main_page.dart';
import 'package:ybc_manager/pages/test_page.dart';
import 'package:ybc_manager/utils/app_color.dart';

void main() {
  locator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<GetProductsCubit>(
        create: (context) => getIt.call(),
        child: MainPage(),
      ),
    );
  }
}
