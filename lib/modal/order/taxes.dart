import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'taxes.g.dart';

@HiveType(typeId: HIVE_TAXES_BOX_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class Taxes extends HiveObject implements Equatable {
  @HiveField(0)
  int id;
  @HiveField(1)
  String total;
  @HiveField(2)
  String subtotal;

  Taxes({this.id, this.total, this.subtotal});

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();

  static const fromJson = _$TaxesFromJson;

  Map<String, dynamic> toJson() => _$TaxesToJson(this);
}
