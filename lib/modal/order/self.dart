import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'self.g.dart';

@HiveType(typeId: HIVE_SELF_BOX_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class Self extends HiveObject implements Equatable {
  @HiveField(0)
  String href;

  Self({this.href});

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();

  static const fromJson = _$SelfFromJson;

  Map<String, dynamic> toJson() => _$SelfToJson(this);
}
