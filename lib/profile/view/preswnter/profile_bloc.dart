import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_bloc/profile/model.dart';
import 'package:medical_bloc/profile/view/preswnter/profile_event.dart';
import 'package:medical_bloc/profile/view/preswnter/profile_status.dart';
import 'package:medical_bloc/utils/images.dart';

// class ProfileBloc extends Bloc<ProfileEvent, ProfileStatus> {
//   final ImagPickerUtils imagPickerUtils;
//   ProfileBloc(this.imagPickerUtils)
//       : super(
//           ProfileStatus(feachers: [
//             ProfileModel(image: Images.mysave, text: 'My Saved'),
//             ProfileModel(image: 'images/profi2.svg', text: 'Payment Method'),
//             ProfileModel(image: 'images/faq.svg', text: 'FAQs'),
//             ProfileModel(image: 'images/logout.svg', text: 'Logout')
//           ]),
//         ) {
//     on<GalleryImagePicker>(imageCapture);
//   }

//   void imageCapture(
//       GalleryImagePicker event, Emitter<ProfileStatus> emit) async {
//     XFile? file = await imagPickerUtils.pickimageFromGallery();
//     emit(state.copyWith(file));
//   }
// }

class ProfileBloc extends Bloc<ProfileEvent, ProfileStatus> {
  final ImagePicker _imagePicker = ImagePicker();

  ProfileBloc()
      : super(ProfileStatus(feachers: [
          ProfileModel(image: Images.mysave, text: 'My Saved'),
          ProfileModel(image: 'images/profi2.svg', text: 'Payment Method'),
          ProfileModel(image: 'images/faq.svg', text: 'FAQs'),
          ProfileModel(image: 'images/logout.svg', text: 'Logout')
        ])) {
    on<GalleryImagePicker>(_onGalleryImagePicker);
  }

  Future<void> _onGalleryImagePicker(
      GalleryImagePicker event, Emitter<ProfileStatus> emit) async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      emit(state.copyWith(file: pickedFile));
    }
  }
}
