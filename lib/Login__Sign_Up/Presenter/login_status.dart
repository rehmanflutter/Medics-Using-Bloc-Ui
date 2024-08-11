import 'package:equatable/equatable.dart';

class LoginStatus extends Equatable {
  bool loginpassword;
  bool siguppassword;
  bool Privacypolicy;

  LoginStatus(
      {this.Privacypolicy = false,
      this.loginpassword = false,
      this.siguppassword = false});

  LoginStatus copyWith(
      {bool? loginpassword = false,
      bool? siguppassword = false,
      bool? Privacypolicy = false}) {
    return LoginStatus(
      Privacypolicy: Privacypolicy ?? this.Privacypolicy,
      loginpassword: loginpassword ?? this.loginpassword,
      siguppassword: siguppassword ?? this.siguppassword,
    );
  }

  @override
  List<Object> get props => [loginpassword, siguppassword, Privacypolicy];
}
