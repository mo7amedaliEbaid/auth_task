import 'dart:convert';
import 'dart:io';

// Function to convert image file to Base64 string
String base64String(File imageFile) {
  // Read the file as bytes
  List<int> imageBytes = imageFile.readAsBytesSync();
  // Encode the bytes to base64 string
  String base64String = base64Encode(imageBytes);
  return base64String;
}