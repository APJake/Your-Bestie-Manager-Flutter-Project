// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductMetaData _$ProductMetaDataFromJson(Map<String, dynamic> json) =>
    ProductMetaData(
      skip: json['skip'] as int,
      limit: json['limit'] as int,
      total: json['total'] as int,
      length: json['length'] as int,
    );

Map<String, dynamic> _$ProductMetaDataToJson(ProductMetaData instance) =>
    <String, dynamic>{
      'skip': instance.skip,
      'limit': instance.limit,
      'total': instance.total,
      'length': instance.length,
    };
