import 'package:file_picker/file_picker.dart';

class PickImageException implements Exception {}

Future<String> pickImage() async {
  String image = "";
  try {
    final filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (filePickerResult != null && filePickerResult.files.isNotEmpty) {
      image = filePickerResult.files.single.path!;
    }
  } catch (e) {
    throw PickImageException();
  }
  return image;
}
