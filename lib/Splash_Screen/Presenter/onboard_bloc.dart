import 'package:bloc/bloc.dart';
import 'package:medical_bloc/Splash_Screen/Presenter/onboard_status.dart';
import 'package:medical_bloc/Splash_Screen/model/splishModel.dart';
import 'package:medical_bloc/utils/images.dart';

// class OnboardBloc extends Bloc<OnboardEvent, OnboardStatus> {
//   OnboardBloc() : super(OnboardStatus());
// }

// BLoC (without events, just state management)
class OnboardBloc extends Cubit<OnboardStatus> {
  OnboardBloc()
      : super(OnboardStatus([
          OnBoardingModel(
              image: Images.onboard1,
              data: 'Find a lot of specialist doctors in one place'),
          OnBoardingModel(
              image: Images.onboard2,
              data: 'Get connect our Online Consultation')
        ]));
}
