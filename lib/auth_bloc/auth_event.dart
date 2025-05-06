part of 'auth_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class AuthenticationLogoutEvent extends AuthenticationEvent {}

class AuthenticationLoginEvent extends AuthenticationEvent {}