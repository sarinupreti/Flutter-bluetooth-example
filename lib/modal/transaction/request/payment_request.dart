import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_request.g.dart';

@JsonSerializable()
class PaymentRequest extends Equatable {
  final int amount;
  final String narration;
  final int recipient;

  PaymentRequest({
    this.amount,
    this.narration,
    this.recipient,
  });

  factory PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRequestToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();
}
