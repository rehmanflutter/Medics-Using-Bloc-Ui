import 'package:equatable/equatable.dart';
import 'package:medical_bloc/Splash_Screen/model/splishModel.dart';

class OnboardStatus extends Equatable {
  List<OnBoardingModel> datashow = [];

  OnboardStatus(this.datashow);

  List<Object> get props => [datashow];
}
