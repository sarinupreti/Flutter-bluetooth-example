import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'package:bell_delivery_hub/data/hive/hive_const.dart';

part 'wallet.g.dart';

@HiveType(typeId: HIVE_WALLET_BOX_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class Wallet extends HiveObject implements Equatable {
  @HiveField(0)
  String id;
  @HiveField(1)
  String walletNo;
  @HiveField(2)
  String denomination;
  @HiveField(3)
  int balance;
  @HiveField(4)
  String createdAt;
  @HiveField(5)
  String updatedAt;
  @HiveField(6)
  String userId;

  Wallet({
    this.id,
    this.walletNo,
    this.denomination,
    this.balance,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  static const fromJson = _$WalletFromJson;

  Map<String, dynamic> toJson() => _$WalletToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();

  Wallet copyWith({
    String id,
    String walletNo,
    String denomination,
    int balance,
    String createdAt,
    String updatedAt,
    String userId,
  }) {
    return Wallet(
      id: id ?? this.id,
      walletNo: walletNo ?? this.walletNo,
      denomination: denomination ?? this.denomination,
      balance: balance ?? this.balance,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
    );
  }
}
