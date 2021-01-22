import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:bell_delivery_hub/modal/order/collection.dart';
import 'package:bell_delivery_hub/modal/order/self.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'links.g.dart';

@HiveType(typeId: HIVE_LINK_BOX_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class Links extends HiveObject implements Equatable {
  @HiveField(0)
  List<Self> self;
  @HiveField(1)
  List<Collection> collection;

  Links({this.self, this.collection});

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
