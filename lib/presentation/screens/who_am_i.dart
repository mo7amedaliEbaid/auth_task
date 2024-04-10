import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohamed_ali/configs/configs.dart';
import 'package:mohamed_ali/core/core.dart';
import 'package:mohamed_ali/data/data.dart';

import '../widgets.dart';

class WhoAmIScreen extends StatefulWidget {
  const WhoAmIScreen({super.key});

  @override
  State<WhoAmIScreen> createState() => _WhoAmIScreenState();
}

class _WhoAmIScreenState extends State<WhoAmIScreen> {
  TextEditingController passwordController = TextEditingController();
  bool isPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    App.init(context);
    UserModel? userModel = injector<HiveHelper>().getUser();
    passwordController.text = userModel?.password ?? "";
    return /*Scaffold(
      body: */
        SafeArea(
      minimum: EdgeInsets.only(
        top: AppDimensions.normalize(
          17,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: Space.hf(1.2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Who Am I",
                    style: AppText.h3b,
                  ),
                  Space.xm!,
                  IconButton(
                    onPressed: () {
                      injector<HiveHelper>().logout(context);
                    },
                    icon: const Icon(
                      Icons.logout,
                    ),
                  )
                ],
              ),
              imageFromBase64String(injector<HiveHelper>().getUser()!.img!),
              Space.yf(1.8),
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
                      decoratedContainer(
                        width: AppDimensions.normalize(65),
                        text: userModel?.fName,
                      ),
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
                      decoratedContainer(
                        width: AppDimensions.normalize(65),
                        text: userModel?.lName,
                      ),
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
              decoratedContainer(
                width: double.infinity,
                text: userModel?.email,
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
                readOnly: true,
                validator: injector<Validators>().validatePassword,
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
              Space.yf(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "User Type",
                  style: AppText.custom,
                ),
              ),
              Space.yf(.5),
              Row(
                children: [
                  Row(
                    children: [
                      userModel?.userType == 0
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(AppAssets.greenRadio),
                                SvgPicture.asset(AppAssets.vector),
                              ],
                            )
                          : SvgPicture.asset(AppAssets.greyRadio),
                      Space.xf(.5),
                      Text(
                        "Seller",
                        style: AppText.h3,
                      )
                    ],
                  ),
                  Space.xf(2),
                  Row(
                    children: [
                      userModel?.userType == 1
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(AppAssets.greenRadio),
                                SvgPicture.asset(AppAssets.vector),
                              ],
                            )
                          : SvgPicture.asset(AppAssets.greyRadio),
                      Space.xf(.5),
                      Text(
                        "Buyer",
                        style: AppText.h3,
                      )
                    ],
                  ),
                  Space.xf(2),
                  Row(
                    children: [
                      userModel?.userType == 2
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(AppAssets.greenRadio),
                                SvgPicture.asset(AppAssets.vector),
                              ],
                            )
                          : SvgPicture.asset(AppAssets.greyRadio),
                      Space.xf(.5),
                      Text(
                        "Both",
                        style: AppText.h3,
                      )
                    ],
                  ),
                ],
              ),
              Space.yf(.8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "About",
                  style: AppText.custom,
                ),
              ),
              Space.yf(.4),
              decoratedContainer(
                  width: double.infinity, text: userModel?.about),
              Space.yf(.8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Salary",
                  style: AppText.custom,
                ),
              ),
              Space.yf(.4),
              decoratedContainer(
                  width: double.infinity, text: "SAR ${userModel?.salary}"),
              Space.yf(.8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Birth Date",
                  style: AppText.custom,
                ),
              ),
              Space.yf(.4),
              Container(
                width: double.infinity,
                padding: Space.all(1.2, 1.1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.normalize(7),
                  ),
                  color: Colors.grey.shade200,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      userModel?.birthDate ?? "",
                      style: AppText.h3,
                    ),
                    const Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Space.yf(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gender",
                  style: AppText.custom,
                ),
              ),
              Space.yf(.5),
              Row(
                children: [
                  Row(
                    children: [
                      userModel?.gender == 0
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(AppAssets.greenRadio),
                                SvgPicture.asset(AppAssets.vector),
                              ],
                            )
                          : SvgPicture.asset(AppAssets.greyRadio),
                      Space.xf(.5),
                      Text(
                        "Male",
                        style: AppText.h3,
                      )
                    ],
                  ),
                  Space.xf(2),
                  Row(
                    children: [
                      userModel?.gender == 1
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(AppAssets.greenRadio),
                                SvgPicture.asset(AppAssets.vector),
                              ],
                            )
                          : SvgPicture.asset(AppAssets.greyRadio),
                      Space.xf(.5),
                      Text(
                        "Female",
                        style: AppText.h3,
                      )
                    ],
                  ),
                ],
              ),
              Space.yf(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Skills",
                  style: AppText.custom,
                ),
              ),
              Space.yf(.4),
              Container(
                height: AppDimensions.normalize(47),
                width: double.infinity,
                padding: Space.all(.8, .6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(
                    AppDimensions.normalize(7),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Wrap(
                    clipBehavior: Clip.hardEdge,
                    spacing: AppDimensions.normalize(3),
                    // horizontal space between children
                    runSpacing: AppDimensions.normalize(0),
                    // vertical space between lines
                    children: List.generate(
                      userModel?.skills?.length ?? 1,
                      (index) {
                        return Chip(
                          padding: Space.all(.3, .3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppDimensions.normalize(5),
                              ),
                              side:
                                  const BorderSide(color: Colors.transparent)),
                          color: MaterialStatePropertyAll(AppColors.lightGreen),
                          label: Text(
                            userModel?.skills?[index],
                            style: AppText.h3?.copyWith(
                              color: Colors.green.shade300,
                            ),
                          ),
                          deleteIcon: Icon(
                            Icons.close,
                            size: AppDimensions.normalize(8),
                            color: Colors.green.shade300,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Space.yf(),
            ],
          ),
        ),
      ),
      //  ),
    );
  }
}
