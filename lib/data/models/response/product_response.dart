import 'package:json_annotation/json_annotation.dart';
import 'package:ybc_manager/data/models/response/product_meta.dart';

import '../product.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  bool status;
  List<Product> data;
  ProductMetaData meta;

  ProductResponse({
    required this.status,
    required this.data,
    required this.meta,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
