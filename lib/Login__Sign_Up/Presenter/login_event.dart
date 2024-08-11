import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class loginPassword extends LoginEvent {}

class SigupPassword extends LoginEvent {}

class PrivacyPolicy extends LoginEvent {}
