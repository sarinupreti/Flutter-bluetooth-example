import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_meta_data.g.dart';

@HiveType(typeId: HIVE_META_DATA_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class MetaData extends HiveObject implements Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String key;
  @HiveField(2)
  final String value;

  MetaData({this.id, this.key, this.value});

  static const fromJson = _$MetaDataFromJson;

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
