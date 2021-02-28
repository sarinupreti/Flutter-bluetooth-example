import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_refund_request.g.dart';

@JsonSerializable()
class AddFundRequest extends Equatable {
  final int amount;

  AddFundRequest({
    this.amount,
  });

  factory AddFundRequest.fromJson(Map<String, dynamic> json) =>
      _$AddFundRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddFundRequestToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();
}
