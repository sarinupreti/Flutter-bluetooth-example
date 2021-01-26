// lib/blocs/Order/Order_event.dart

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllOrders extends OrderEvent {
  GetAllOrders();

  @override
  List<Object> get props => [];
}

class UpdateOrders extends OrderEvent {
  final int orderId;

  UpdateOrders(this.orderId);

  @override
  List<Object> get props => [orderId];
}
