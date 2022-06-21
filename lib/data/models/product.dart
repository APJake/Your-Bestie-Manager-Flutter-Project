import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  String prefix;
  String codeNo;
  String type;
  int price;
  Product(
    this.prefix,
    this.codeNo,
    this.type,
    this.price,
  );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
