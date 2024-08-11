// import 'package:equatable/equatable.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:medical_bloc/profile/model.dart';

// class ProfileStatus extends Equatable {
//   late XFile? file;
//   List<ProfileModel> feachers = [];
//   ProfileStatus({required this.feachers, this.file});

//   ProfileStatus copyWith(XFile? file) {
//     return ProfileStatus(feachers: [], file: file ?? this.file);
//   }

//   @override
//   List<Object> get props => [file!];
// }
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_bloc/profile/model.dart';

class ProfileStatus extends Equatable {
  final XFile? file;
  final List<ProfileModel> feachers;

  ProfileStatus({required this.feachers, this.file});

  ProfileStatus copyWith({
    XFile? file,
  }) {
    return ProfileStatus(
      feachers: feachers,
      file: file ?? this.file,
    );
  }

  @override
  List<Object?> get props => [file];
}
