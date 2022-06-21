import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ybc_manager/bloc/products/get/cubit/get_products_cubit.dart';
import 'package:ybc_manager/data/api/api_service.dart';
import 'package:ybc_manager/data/product_repository.dart';

var getIt = GetIt.I;

void locator() {
  Dio dio = Dio();
  getIt.registerLazySingleton(() => dio);

  ApiService apiService = ApiService(getIt.call());
  getIt.registerLazySingleton(() => apiService);

  ProductRepository productRepository = ProductRepository(getIt.call());
  getIt.registerLazySingleton(() => productRepository);

  GetProductsCubit getProductsCubit = GetProductsCubit(getIt.call());
  getIt.registerLazySingleton(() => getProductsCubit);
}
