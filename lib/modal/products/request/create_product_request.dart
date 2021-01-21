import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_product_request.g.dart';

@JsonSerializable()
class CreateProductRequest {
  String slug;
  String name;
  int parent;

  CreateProductRequest({this.slug, this.name, this.parent});

  factory CreateProductRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductRequestToJson(this);
}
