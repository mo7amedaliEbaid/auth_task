import 'package:flutter/material.dart';
import 'package:mohamed_ali/configs/configs.dart';

Widget customTextField(
    {required String labelText,
    Widget? prefix,
    Widget? suffix,
    bool? obscureText,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    required TextEditingController controller}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: validator,
    controller: controller,
    onChanged: onChanged,
    obscureText: obscureText ?? false,
    style: AppText.b2b,
    decoration: InputDecoration(
      errorMaxLines: 5,
      enabledBorder: OutlineInputBorder(
        borderSide:  BorderSide(
          color: Colors.grey.shade100,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(4),
        ),
      ),
      focusedBorder: InputBorder.none,
      contentPadding: Space.all(1, 1),
      fillColor: Colors.grey.shade100,
      filled: true,
      border: const OutlineInputBorder(),
      label: Center(
        child: Text(
          labelText,
          style: AppText.h3b?.copyWith(
            color: Colors.grey,
          ),
        ),
      ),
      alignLabelWithHint: true,
      prefixIcon: prefix,
      suffixIcon: suffix,
      errorStyle: AppText.b2b!.copyWith(
        color: Colors.red,
      ),
    ),
  );
}
