import 'package:image_picker/image_picker.dart';

class ImagPickerUtils {
  final ImagePickers = ImagePicker();

  Future<XFile> pickimageFromGallery() async {
    final XFile? file =
        await ImagePickers.pickImage(source: ImageSource.gallery);
    return file!;
  }
}
