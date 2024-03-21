import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mohamed_ali/configs/configs.dart';
import 'package:mohamed_ali/core/core.dart';

Widget servicesItem() {
  return Material(
    borderRadius: BorderRadius.circular(
      AppDimensions.normalize(3),
    ),
    elevation: 1,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(3),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                AppAssets.servicePng,
                height: AppDimensions.normalize(49),
                // width: AppDimensions.normalize(54),
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: AppDimensions.normalize(3),
                left: AppDimensions.normalize(3),
                child: Container(
                  height: AppDimensions.normalize(11),
                  width: AppDimensions.normalize(24),
                  decoration: BoxDecoration(
                    color: Colors.green.shade300,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Center(
                    child: Text(
                      "\$100",
                      style: AppText.b2!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          Space.yf(.3),
          Padding(
            padding: Space.hf(.6),
            child: Text(
              "Logo Design -Graphic\nDesign Graphic Design",
              style: AppText.b2,
            ),
          ),
          Space.yf(),
          Row(
            children: [
              SvgPicture.asset(AppAssets.star),
              Space.xf(.3),
              Text(
                "(4.5)",
                style: AppText.custom.copyWith(color: Colors.amber),
              ),
              Space.xf(.4),
              Container(
                height: AppDimensions.normalize(5),
                width: .8,
                color: Colors.grey,
              ),
              Space.xf(.4),
              SvgPicture.asset(AppAssets.bag),
              Space.xf(.3),
              Text("20", style: AppText.l1!.copyWith(color: Colors.grey)),
            ],
          )
        ],
      ),
    ),
  );
}
