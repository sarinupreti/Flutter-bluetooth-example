import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_download.g.dart';

@HiveType(typeId: HIVE_PRODUCT_DOWNLOAD_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class ProductDownload extends HiveObject implements Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String file;

  ProductDownload({this.id, this.name, this.file});

  static const fromJson = _$ProductDownloadFromJson;

  Map<String, dynamic> toJson() => _$ProductDownloadToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
