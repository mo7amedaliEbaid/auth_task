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
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;
  bool isCheckBoxToggled = true;

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
                Space.yf(.4),
                customTextField(controller: emailController),
                Space.yf(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: AppText.custom,
                  ),
                ),
                Space.yf(.4),
                customTextField(
                  controller: passwordController,
                  obscureText: isObscure,
                  suffix: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: Icon(
                      isObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                ),
                Space.yf(.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: isCheckBoxToggled,
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppDimensions.normalize(1),
                              ),
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            fillColor:
                                MaterialStatePropertyAll(Colors.green.shade300),
                            onChanged: (value) {
                              setState(() {
                                isCheckBoxToggled = value!;
                              });
                            }),
                        Text(
                          "Remember me",
                          style: AppText.custom,
                        )
                      ],
                    ),
                    Text(
                      "Forgot Password?",
                      style: AppText.custom,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
