// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      status: json['status'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: ProductMetaData.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'meta': instance.meta,
    };
