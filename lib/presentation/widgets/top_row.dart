import 'package:flutter/material.dart';
import 'package:mohamed_ali/configs/configs.dart';
import 'package:mohamed_ali/core/core.dart';

Widget topRow({
  required String title,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
      //  Space.xf(1.2),
        Icon(
          Icons.arrow_back_ios,
          size: AppDimensions.normalize(10),
        ),
        Text(
          title,
          style: AppText.h2b,
        )
      ],
    ),
  );
}
