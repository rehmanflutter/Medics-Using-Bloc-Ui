import 'package:bloc/bloc.dart';
import 'package:medical_bloc/home/Presenter/home_status.dart';
import 'package:medical_bloc/home/model/topDoctorModel.dart';
import 'package:medical_bloc/utils/images.dart';

class HomeBloc extends Cubit<HomeStatus> {
  HomeBloc()
      : super(HomeStatus([
          TopdoctorModel(
              doctorImage: Images.doctor1,
              doctorName: 'Dr. Stevi Jessi',
              loction: '2km away',
              rating: 4.8,
              type: 'Orthopedist'),
          TopdoctorModel(
              doctorImage: Images.doctor2,
              doctorName: 'Dr. Maria Elena',
              loction: '1,5km away',
              rating: 4.9,
              type: 'Psychologist'),
          TopdoctorModel(
              doctorImage: Images.doctor4,
              doctorName: 'Dr. Marcus Horizon',
              loction: '800m away',
              rating: 4.6,
              type: 'Chardiologist'),
          TopdoctorModel(
              doctorImage: Images.doctor3,
              doctorName: 'Dr. Stefi Jessi',
              loction: '800m away',
              rating: 4.7,
              type: 'Orthopedist')
        ]));
}
