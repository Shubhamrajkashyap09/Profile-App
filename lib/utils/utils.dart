import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> capturePhoto({
  required ImagePicker picker,
  int imageQuality = 35,
  double maxHeight = 600,
  double maxWidth = 900,
}) async {
  final pickedFile = await picker.pickImage(
    source: ImageSource.camera,
    imageQuality: imageQuality,
    maxHeight: maxHeight,
    maxWidth: maxWidth,
  );

  if (pickedFile != null) {
    return File(pickedFile.path);
  }

  return null;
}
