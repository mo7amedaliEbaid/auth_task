import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohamed_ali/configs/configs.dart';
import 'package:mohamed_ali/core/core.dart';
import 'package:mohamed_ali/data/data.dart';
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
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    UserModel? userModel = injector<HiveHelper>().getUser();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: Space.vf(3),
          child: Padding(
            padding: Space.hf(1.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                topRow(title: "Account Login"),
                Space.yf(.8),
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
                  maxLines: 1,
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
                ),
                Space.yf(1.35),
                customElevatedButton(
                  onTap: () {
                    setState(() {
                      isLoading = true;
                    });
                    if (userModel?.email == emailController.text.trim() &&
                        userModel?.password == passwordController.text.trim()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.white,
                          content: Text(
                            "Successful Logging In , Welcome Back.",
                            style: AppText.b1b?.copyWith(color: Colors.green),
                          ),
                        ),
                      );
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.of(context).pushNamed(AppRoutes.whoAmI);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Wrong Email Or Password, Try Again",
                            style: AppText.b1b?.copyWith(color: Colors.red),
                          ),
                        ),
                      );
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  text: isLoading ? 'Wait...' : 'Login',
                  heightFraction: 23,
                  width: double.infinity,
                  color: Colors.green.shade300,
                ),
                Space.yf(1.35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account ? ",
                      style: AppText.custom
                          .copyWith(fontSize: AppDimensions.normalize(5.6)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.register);
                      },
                      child: Text(
                        "Register",
                        style:
                            AppText.b1b?.copyWith(color: Colors.green.shade300),
                      ),
                    ),
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
