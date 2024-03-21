import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';

import 'package:mohamed_ali/configs/configs.dart';

Widget imageFromBase64String(String base64String) {
  // Decode the Base64 string to bytes
  Uint8List bytes = base64Decode(base64String);
  // Convert bytes to Image widget
   return Stack(
     alignment: Alignment.center,
     clipBehavior: Clip.none,
     children: [
       CircleAvatar(
          minRadius: AppDimensions.normalize(17),
          backgroundImage: MemoryImage(bytes,),),
       Positioned(
         bottom: -AppDimensions.normalize(2),
         right: AppDimensions.normalize(50),
         child: Container(
           height: AppDimensions.normalize(10),
           width: AppDimensions.normalize(10),
           decoration: BoxDecoration(
               shape: BoxShape.circle,
               color: Colors.green.shade300),
           child: Icon(
             Icons.add,
             color: Colors.white,
             size: AppDimensions.normalize(7),
           ),
         ),
       )
     ],
   );
}
