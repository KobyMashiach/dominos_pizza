part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginStateLoading extends LoginState {}
