import 'package:bots_demo/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: HIVE_TRANSACTION_BOX_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class TransactionHistory extends HiveObject implements Equatable {
  @HiveField(0)
  String id;
  @HiveField(1)
  String type;
  @HiveField(2)
  int amount;
  @HiveField(3)
  String recipient;
  @HiveField(4)
  String narration;
  @HiveField(5)
  String status;
  @HiveField(6)
  int walletBalance;
  @HiveField(7)
  String denomination;
  @HiveField(8)
  String errMsg;
  @HiveField(9)
  String txnReference;
  @HiveField(10)
  String createdAt;
  @HiveField(11)
  String updatedAt;
  @HiveField(12)
  String walletId;

  //
  TransactionHistory({
    this.id,
    this.type,
    this.amount,
    this.recipient,
    this.narration,
    this.status,
    this.walletBalance,
    this.denomination,
    this.errMsg,
    this.txnReference,
    this.createdAt,
    this.updatedAt,
    this.walletId,
  });

  static const fromJson = _$TransactionHistoryFromJson;

  Map<String, dynamic> toJson() => _$TransactionHistoryToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();

  TransactionHistory copyWith({
    String id,
    String type,
    int amount,
    String recipient,
    String narration,
    String status,
    int walletBalance,
    String denomination,
    String errMsg,
    String txnReference,
    String createdAt,
    String updatedAt,
    String walletId,
  }) {
    return TransactionHistory(
      id: id ?? this.id,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      recipient: recipient ?? this.recipient,
      narration: narration ?? this.narration,
      status: status ?? this.status,
      walletBalance: walletBalance ?? this.walletBalance,
      denomination: denomination ?? this.denomination,
      errMsg: errMsg ?? this.errMsg,
      txnReference: txnReference ?? this.txnReference,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      walletId: walletId ?? this.walletId,
    );
  }
}
