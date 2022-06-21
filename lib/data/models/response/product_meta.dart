import 'package:json_annotation/json_annotation.dart';

part 'product_meta.g.dart';

@JsonSerializable()
class ProductMetaData {
  int skip;
  int limit;
  int total;
  int length;
  ProductMetaData({
    required this.skip,
    required this.limit,
    required this.total,
    required this.length,
  });

  factory ProductMetaData.fromJson(Map<String, dynamic> json) =>
      _$ProductMetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductMetaDataToJson(this);
}
