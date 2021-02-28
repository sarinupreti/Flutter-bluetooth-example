// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionHistoryAdapter extends TypeAdapter<TransactionHistory> {
  @override
  final int typeId = 3;

  @override
  TransactionHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionHistory(
      id: fields[0] as String,
      type: fields[1] as String,
      amount: fields[2] as int,
      recipient: fields[3] as String,
      narration: fields[4] as String,
      status: fields[5] as String,
      walletBalance: fields[6] as int,
      denomination: fields[7] as String,
      errMsg: fields[8] as String,
      txnReference: fields[9] as String,
      createdAt: fields[10] as String,
      updatedAt: fields[11] as String,
      walletId: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionHistory obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.recipient)
      ..writeByte(4)
      ..write(obj.narration)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.walletBalance)
      ..writeByte(7)
      ..write(obj.denomination)
      ..writeByte(8)
      ..write(obj.errMsg)
      ..writeByte(9)
      ..write(obj.txnReference)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.updatedAt)
      ..writeByte(12)
      ..write(obj.walletId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionHistory _$TransactionHistoryFromJson(Map<String, dynamic> json) {
  return TransactionHistory(
    id: json['id'] as String,
    type: json['type'] as String,
    amount: json['amount'] as int,
    recipient: json['recipient'] as String,
    narration: json['narration'] as String,
    status: json['status'] as String,
    walletBalance: json['walletBalance'] as int,
    denomination: json['denomination'] as String,
    errMsg: json['errMsg'] as String,
    txnReference: json['txnReference'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    walletId: json['walletId'] as String,
  );
}

Map<String, dynamic> _$TransactionHistoryToJson(TransactionHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'amount': instance.amount,
      'recipient': instance.recipient,
      'narration': instance.narration,
      'status': instance.status,
      'walletBalance': instance.walletBalance,
      'denomination': instance.denomination,
      'errMsg': instance.errMsg,
      'txnReference': instance.txnReference,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'walletId': instance.walletId,
    };
