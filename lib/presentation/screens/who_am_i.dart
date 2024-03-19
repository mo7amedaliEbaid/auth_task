import 'package:flutter/material.dart';
import 'package:mohamed_ali/core/core.dart';

import '../widgets.dart';

class WhoAmIScreen extends StatelessWidget {
  const WhoAmIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: imageFromBase64String(injector<HiveHelper>().getUser()!.img!),
      ),
    );
  }
}
