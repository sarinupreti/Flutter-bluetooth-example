// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductRequest _$CreateProductRequestFromJson(Map<String, dynamic> json) {
  return CreateProductRequest(
    slug: json['slug'] as String,
    name: json['name'] as String,
    parent: json['parent'] as int,
  );
}

Map<String, dynamic> _$CreateProductRequestToJson(
        CreateProductRequest instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'parent': instance.parent,
    };
