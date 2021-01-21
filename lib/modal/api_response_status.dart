import 'package:bell_delivery_hub/globals/exveptions/network_exceptions.dart';
import 'package:equatable/equatable.dart';

class ApiResponseStatus<T> extends Equatable {
  final T data;
  final NetworkExceptions error;
  final bool isSuccessful;
  final bool fromLocal;
  final bool isAtEnd;

  ApiResponseStatus(
      {this.data, this.error, this.isSuccessful, this.fromLocal, this.isAtEnd});

  @override
  List<Object> get props => [data, error, isSuccessful, fromLocal, isAtEnd];
}
