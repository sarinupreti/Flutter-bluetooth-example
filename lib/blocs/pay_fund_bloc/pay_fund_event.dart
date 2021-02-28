part of 'pay_fund_bloc.dart';

abstract class PayFundEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PayFundToAccount extends PayFundEvent {
  final PaymentRequest paymentRequest;

  PayFundToAccount(this.paymentRequest);

  @override
  List<Object> get props => [];
}
