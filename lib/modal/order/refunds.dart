import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'refunds.g.dart';

@HiveType(typeId: HIVE_META_BOX_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class Refunds extends HiveObject implements Equatable {
  @HiveField(0)
  int id;
  @HiveField(1)
  String reason;
  @HiveField(2)
  String total;

  Refunds({this.id, this.reason, this.total});

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();

  static const fromJson = _$RefundsFromJson;

  Map<String, dynamic> toJson() => _$RefundsToJson(this);
}
