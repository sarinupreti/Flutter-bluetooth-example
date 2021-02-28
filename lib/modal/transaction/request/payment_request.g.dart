// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) {
  return PaymentRequest(
    amount: json['amount'] as int,
    narration: json['narration'] as String,
    recipient: json['recipient'] as int,
  );
}

Map<String, dynamic> _$PaymentRequestToJson(PaymentRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'narration': instance.narration,
      'recipient': instance.recipient,
    };
