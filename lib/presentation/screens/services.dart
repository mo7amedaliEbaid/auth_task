import 'package:flutter/material.dart';
import 'package:mohamed_ali/core/core.dart';
import 'package:mohamed_ali/configs/configs.dart';
import 'package:mohamed_ali/presentation/widgets.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(
        top: AppDimensions.normalize(
          17,
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: Space.hf(1.2),
              child: Text(
                "Services",
                style: AppText.h3b,
              ),
            ),
          ),
          Space.yf(1.5),
          SizedBox(
            height: AppDimensions.normalize(90),
            child: ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              padding: Space.hf(1.2),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return servicesItem();
              },
              separatorBuilder: (BuildContext context, int index) {
                return Space.xf(.7);
              },
            ),
          ),
          Space.yf(2.3),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: Space.hf(1.2),
              child: Text(
                "Popular Services",
                style: AppText.h3b,
              ),
            ),
          ),
          Space.yf(1.5),
          SizedBox(
            height: AppDimensions.normalize(90),
            child: ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              padding: Space.hf(1.2),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return servicesItem();
              },
              separatorBuilder: (BuildContext context, int index) {
                return Space.xf(.7);
              },
            ),
          ),
        ],
      ),
    );
  }
}
