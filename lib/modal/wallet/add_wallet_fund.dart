import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_wallet_fund.g.dart';

@JsonSerializable()
class AddWalletFundResponse {
  final String url;
  final String reference;

  AddWalletFundResponse({this.url, this.reference});

  static const fromJson = _$AddWalletFundResponseFromJson;

  Map<String, dynamic> toJson() => _$AddWalletFundResponseToJson(this);
}
