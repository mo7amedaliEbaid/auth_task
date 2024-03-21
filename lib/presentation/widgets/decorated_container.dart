import 'package:flutter/material.dart';
import 'package:mohamed_ali/configs/configs.dart';
import 'package:mohamed_ali/core/core.dart';

Widget decoratedContainer({
  String? text,
  required double width,
}) {
  return Container(
    width: width,
    padding: Space.all(1.2, 1.1),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        AppDimensions.normalize(7),
      ),
      color: Colors.grey.shade200,
    ),
    child: Text(
      text ?? "",
      style: AppText.h3,
    ),
  );
}
