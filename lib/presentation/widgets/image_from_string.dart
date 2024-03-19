import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';

Widget imageFromBase64String(String base64String) {
  // Decode the Base64 string to bytes
  Uint8List bytes = base64Decode(base64String);
  // Convert bytes to Image widget
  return Image.memory(bytes, fit: BoxFit.cover);
}
