import 'package:bloc/bloc.dart';
import 'package:medical_bloc/Login__Sign_Up/Presenter/login_event.dart';
import 'package:medical_bloc/Login__Sign_Up/Presenter/login_status.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStatus> {
  LoginBloc() : super(LoginStatus()) {
    on<loginPassword>(_loginpassword);
    on<SigupPassword>(_sigupPassword);

    on<PrivacyPolicy>(_Privacypolicy);
  }

  void _loginpassword(loginPassword event, Emitter<LoginStatus> emit) {
    emit(state.copyWith(loginpassword: !state.loginpassword));
  }

  void _sigupPassword(SigupPassword event, Emitter<LoginStatus> emit) {
    emit(state.copyWith(siguppassword: !state.siguppassword));
  }

  void _Privacypolicy(PrivacyPolicy event, Emitter<LoginStatus> emit) {
    emit(state.copyWith(Privacypolicy: !state.Privacypolicy));
  }
}
