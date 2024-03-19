import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mohamed_ali/core/core.dart';
import 'package:mohamed_ali/configs/configs.dart';
import 'package:mohamed_ali/presentation/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;
  String selectedOption = 'Select a Type'; // Default selected option
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: Space.vf(3),
          child: Padding(
            padding: Space.hf(1.2),
            child: Column(
              children: [
                topRow(
                  title: "Register",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Space.yf(1.7),
                SvgPicture.asset(AppAssets.step1Svg),
                Space.yf(1.4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First Name",
                          style: AppText.custom,
                        ),
                        Space.yf(.4),
                        SizedBox(
                          width: AppDimensions.normalize(65),
                          child: customTextField(
                            controller: firstNameController,
                          ),
                        )
                      ],
                    ),
                    Space.xf(.5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Last Name",
                          style: AppText.custom,
                        ),
                        Space.yf(.4),
                        SizedBox(
                          width: AppDimensions.normalize(65),
                          child: customTextField(
                            controller: lastNameController,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Space.yf(.8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email Address",
                    style: AppText.custom,
                  ),
                ),
                Space.yf(.4),
                customTextField(
                  controller: emailController,
                ),
                Space.yf(.8),
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
                  obscureText: isPasswordObscure,
                  maxLines: 1,
                  suffix: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordObscure = !isPasswordObscure;
                      });
                    },
                    child: Icon(
                      isPasswordObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                Space.yf(.8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Confirm Password",
                    style: AppText.custom,
                  ),
                ),
                Space.yf(.4),
                customTextField(
                  controller: confirmPasswordController,
                  obscureText: isConfirmPasswordObscure,
                  maxLines: 1,
                  suffix: GestureDetector(
                    onTap: () {
                      setState(() {
                        isConfirmPasswordObscure = !isConfirmPasswordObscure;
                      });
                    },
                    child: Icon(
                      isConfirmPasswordObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                Space.yf(.8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "User Type",
                    style: AppText.custom,
                  ),
                ),
                Space.yf(.4),
                Container(
                    padding: EdgeInsets.only(
                      left: AppDimensions.normalize(7),
                      right: AppDimensions.normalize(3),
                      top: AppDimensions.normalize(3),
                      bottom: AppDimensions.normalize(3),
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.normalize(7),
                      ),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: const SizedBox.shrink(),
                      value: selectedOption,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.normalize(7),
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: AppDimensions.normalize(15),
                        color: Colors.grey.shade500,
                      ),
                      onChanged: (newValue) {
                        // When the dropdown is changed, update the selected option
                        setState(() {
                          selectedOption = newValue!;
                        });
                      },
                      items: <String>[
                        'Select a Type',
                        'Seller',
                        'Buyer',
                        'Both'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: AppText.b1,
                          ),
                        );
                      }).toList(),
                    )),
                Space.yf(1.5),
                Align(
                  alignment: Alignment.centerRight,
                  child: customElevatedButton(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.completeData,
                      );
                    },
                    text: "Next",
                    heightFraction: 23,
                    width: AppDimensions.normalize(63),
                    color: Colors.green.shade300,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
