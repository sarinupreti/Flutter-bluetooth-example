// lib/blocs/Order/Order_state.dart

import 'package:bell_delivery_hub/modal/order/order.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class OrderState extends Equatable {
  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OderUpdatingSuccess extends OrderState {}

class OrderSuccess extends OrderState {
  final List<Order> orders;

  OrderSuccess({@required this.orders});

  @override
  List<Object> get props => [orders];
}

class OrderFailure extends OrderState {
  final String error;

  OrderFailure({@required this.error});

  @override
  List<Object> get props => [error];
}
