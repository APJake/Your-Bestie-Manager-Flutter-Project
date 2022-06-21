import 'package:ybc_manager/data/api/api_service.dart';
import 'package:ybc_manager/data/models/product.dart';

class ProductRepository {
  final ApiService _apiService;
  ProductRepository(this._apiService);
  Future<List<Product>> getProducts() async {
    var response = await _apiService.getProducts();
    if (response.status) {
      return response.data;
    } else {
      throw Exception("Response status false");
    }
  }

  Future<Product> addProduct(Product product) {
    return _apiService.addProduct(product);
  }

  Future<Product> updateProduct(String id, Product product) {
    return _apiService.updateProduct(id, product);
  }

  Future<Product> deleteProduct(String id) {
    return _apiService.deleteProduct(id);
  }
}
