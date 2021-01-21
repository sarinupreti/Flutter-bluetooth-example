import 'package:bell_delivery_hub/modal/website_data.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

// Fired just after the app is launched
class AppLoaded extends AuthenticationEvent {}

class IsLoggedIn extends AuthenticationEvent {}

// Fired when a user has successfully logged in
class UserLoggedIn extends AuthenticationEvent {
  final WebsiteData websiteData;

  UserLoggedIn({@required this.websiteData});

  @override
  List<Object> get props => [websiteData];
}

// Fired when the user has logged out
class UserLoggedOut extends AuthenticationEvent {}
