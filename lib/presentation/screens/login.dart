import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohamed_ali/configs/configs.dart';
import 'package:mohamed_ali/core/core.dart';
import 'package:mohamed_ali/presentation/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: Space.vf(4),
          child: Padding(
            padding: Space.hf(1.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                topRow(title: "Account Login"),
                Center(
                  child: SvgPicture.asset(
                    AppAssets.loginSvg,
                  ),
                ),
                Space.yf(2),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email Address",
                    style: AppText.custom,
                  ),
                ),
                customTextField(labelText: '', controller: emailController)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
