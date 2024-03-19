import 'package:flutter/material.dart';
import 'package:mohamed_ali/configs/configs.dart';

Widget customTextField(
    {Widget? prefix,
    Widget? suffix,
    bool? obscureText,
    int? maxLines,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    required TextEditingController controller}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: validator,
    controller: controller,
    onChanged: onChanged,
    cursorColor: Colors.grey,
    maxLines: maxLines,
    obscureText: obscureText ?? false,
    style: AppText.b1,
    decoration: InputDecoration(
      errorMaxLines: 5,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(7),
        ),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(7),
        ),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      contentPadding: Space.all(1.2, 1.1),
      fillColor: Colors.grey.shade100,
      filled: true,
      border: const OutlineInputBorder(),
      alignLabelWithHint: true,
      prefixIcon: prefix,
      suffixIcon: suffix,
      errorStyle: AppText.b2b!.copyWith(
        color: Colors.red,
      ),
    ),
  );
}
