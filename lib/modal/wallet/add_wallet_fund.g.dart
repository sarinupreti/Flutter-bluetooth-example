// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_wallet_fund.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddWalletFundResponse _$AddWalletFundResponseFromJson(
    Map<String, dynamic> json) {
  return AddWalletFundResponse(
    url: json['url'] as String,
    reference: json['reference'] as String,
  );
}

Map<String, dynamic> _$AddWalletFundResponseToJson(
        AddWalletFundResponse instance) =>
    <String, dynamic>{
      'url': instance.url,
      'reference': instance.reference,
    };
