// lib/blocs/Order/Order_bloc.dart

import 'package:bell_delivery_hub/globals/exveptions/authentication_exception.dart';
import 'package:bell_delivery_hub/globals/exveptions/network_exceptions.dart';
import 'package:bell_delivery_hub/order_bloc/repository/order_repository.dart';
import 'package:bloc/bloc.dart';

//
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _orderRepository;
  int page = 1;
  bool isFetching = false;

  OrderBloc(OrderRepository orderRepository)
      : assert(orderRepository != null),
        _orderRepository = orderRepository,
        super(OrderInitial());

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is GetAllOrders) {
      yield* _mapOrderWithEmailToState(event);
    }

    if (event is UpdateOrders) {
      yield* _mapUpdateOrderStatus(event);
    }
  }

  Stream<OrderState> _mapOrderWithEmailToState(GetAllOrders event) async* {
    yield OrderLoading();
    try {
      final data = await _orderRepository.getAllOdersFromApi(page);
      if (data.isSuccessful) {
        yield OrderSuccess(orders: data.data);
        page++;
      } else {
        yield OrderFailure(
            error: NetworkExceptions.getErrorMessage(data.error));
      }
    } on AuthenticationException catch (e) {
      yield OrderFailure(error: e.message);
    } catch (err) {
      yield OrderFailure(error: err.message ?? 'An unknown error occured');
    }
  }

  Stream<OrderState> _mapUpdateOrderStatus(UpdateOrders event) async* {
    yield OrderLoading();
    try {
      final data = await _orderRepository.updateOrderFromApi(event.orderId);
      if (data.isSuccessful) {
        yield OderUpdatingSuccess();
      } else {
        yield OrderFailure(
            error: NetworkExceptions.getErrorMessage(data.error));
      }
    } on AuthenticationException catch (e) {
      yield OrderFailure(error: e.message);
    } catch (err) {
      yield OrderFailure(error: err.message ?? 'An unknown error occured');
    }
  }
}
