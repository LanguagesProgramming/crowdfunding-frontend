import 'dart:convert';
import 'dart:io';

class ImageToBase64 {
  static Future<String> convert(File image) async {
    List<int> imageBytes = await image.readAsBytes();
    String base64String = base64Encode(imageBytes);
    return 'data:image/jpeg;base64,$base64String';
  }
}
