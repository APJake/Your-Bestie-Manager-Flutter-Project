// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['prefix'] as String,
      json['codeNo'] as String,
      json['type'] as String,
      json['price'] as int,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'prefix': instance.prefix,
      'codeNo': instance.codeNo,
      'type': instance.type,
      'price': instance.price,
    };
