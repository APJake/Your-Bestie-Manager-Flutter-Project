import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ybc_manager/data/models/product.dart';
import 'package:ybc_manager/data/models/response/product_response.dart';
import './api_config.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConfig.BASE_URL)
abstract class ApiService {
  factory ApiService(Dio dio) => _ApiService(dio);

  @GET("product")
  Future<ProductResponse> getProducts();

  @POST("product")
  Future<Product> addProduct(@Body() Product product);

  @PUT("product/{id}")
  Future<Product> updateProduct(@Path() String id, @Body() Product product);

  @DELETE("product/{id}")
  Future<Product> deleteProduct(@Path() String id);
}
