// lib/blocs/login/login_event.dart

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInWithEmailButtonPressed extends LoginEvent {
  final String websiteUrl;
  final String consumerKey;
  final String consumerSecret;

  LoginInWithEmailButtonPressed(
      {@required this.websiteUrl,
      @required this.consumerKey,
      this.consumerSecret});

  @override
  List<Object> get props => [websiteUrl, consumerKey, consumerSecret];
}
