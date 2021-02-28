part of 'add_fund_bloc.dart';

abstract class AddFundEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddFundToAccount extends AddFundEvent {
  final AddFundRequest addFundRequest;

  AddFundToAccount(this.addFundRequest);

  @override
  List<Object> get props => [];
}
