import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ybc_manager/data/models/product.dart';
import 'package:ybc_manager/data/product_repository.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  final ProductRepository _productRepository;
  GetProductsCubit(this._productRepository) : super(GetProductsLoading());

  void getProducts() {
    emit(GetProductsLoading());
    _productRepository.getProducts().then((value) {
      emit(GetProductsSuccess(value));
    }).catchError((error) {
      if (error.type == DioErrorType.other) {
        emit(const GetProductsFail("Network error"));
      } else {
        emit(GetProductsFail(error.message.toString()));
      }
    });
  }
}
