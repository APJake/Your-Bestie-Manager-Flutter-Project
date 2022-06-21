part of 'get_products_cubit.dart';

abstract class GetProductsState extends Equatable {
  const GetProductsState();

  @override
  List<Object> get props => [];
}

class GetProductsLoading extends GetProductsState {}

class GetProductsSuccess extends GetProductsState {
  final List<Product> products;
  const GetProductsSuccess(this.products);
  @override
  List<Object> get props => [products];
}

class GetProductsFail extends GetProductsState {
  final String error;
  const GetProductsFail(this.error);
  @override
  List<Object> get props => [error];
}
