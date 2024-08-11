import 'package:equatable/equatable.dart';
import 'package:medical_bloc/home/model/topDoctorModel.dart';

class HomeStatus extends Equatable {
  List<TopdoctorModel> TopDoctor;
  HomeStatus(this.TopDoctor);

  @override
  List<Object> get props => [TopDoctor];
}
