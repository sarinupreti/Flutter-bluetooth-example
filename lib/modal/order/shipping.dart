import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'shipping.g.dart';

@HiveType(typeId: HIVE_SHIPPING_BOX_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class Shipping extends HiveObject implements Equatable {
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String lastName;
  @HiveField(2)
  String company;
  @HiveField(3)
  String address1;
  @HiveField(4)
  String address2;
  @HiveField(5)
  String city;
  @HiveField(6)
  String state;
  @HiveField(7)
  String postcode;
  @HiveField(8)
  String country;

  Shipping(
      {this.firstName,
      this.lastName,
      this.company,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.postcode,
      this.country});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool get stringify => throw UnimplementedError();
}
