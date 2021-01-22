import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'collection.g.dart';

@HiveType(typeId: HIVE_COLLECTION_BOX_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class Collection extends HiveObject implements Equatable {
  @HiveField(0)
  String href;

  Collection({this.href});

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
