import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohamed_ali/core/core.dart';
import 'package:mohamed_ali/configs/configs.dart';
import 'package:mohamed_ali/cubits/cubits.dart';
import 'package:mohamed_ali/data/data.dart';
import 'package:mohamed_ali/presentation/widgets.dart';
import 'dart:io';

class CompleteDataScreen extends StatefulWidget {
  const CompleteDataScreen({super.key, required this.step1user});

  final Step1User step1user;

  @override
  State<CompleteDataScreen> createState() => _CompleteDataScreenState();
}

class _CompleteDataScreenState extends State<CompleteDataScreen> {
  TextEditingController aboutController = TextEditingController();
  DateTime? selectedDate;
  File? image;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
                SvgPicture.asset(AppAssets.step2Svg),
                Space.yf(1.5),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: const Center(child: Text("Source")),
                          content: const Text("Choose Image Source"),
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          actions: [
                            TextButton(
                              child: const Text("Camera"),
                              onPressed: () async {
                                Navigator.of(context).pop();

                                // If file picker is not supported, capture image from camera
                                final XFile? capturedImage =
                                    await ImagePicker().pickImage(
                                  source: ImageSource.camera,
                                );

                                if (capturedImage != null) {
                                  setState(() {
                                    image = File(capturedImage.path);
                                  });
                                }
                              },
                            ),
                            TextButton(
                              child: const Text("Gallery"),
                              onPressed: () async {
                                Navigator.of(context).pop();

                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.media,
                                  allowMultiple: false,
                                  withData:
                                      true, // Add this line to get the file data
                                );

                                if (result != null && result.files.isNotEmpty) {
                                  File newImage =
                                      File(result.files.first.path!);

                                  setState(() {
                                    image = File(newImage.path);
                                  });
                                }
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: image == null
                      ? Image.asset(
                          AppAssets.addImage,
                          height: AppDimensions.normalize(35),
                        )
                      : Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                                minRadius: AppDimensions.normalize(17),
                                backgroundImage: FileImage(image!)),
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
                                  Icons.edit,
                                  color: Colors.white,
                                  size: AppDimensions.normalize(7),
                                ),
                              ),
                            )
                          ],
                        ),
                ),
                Space.yf(.4),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "About",
                    style: AppText.custom,
                  ),
                ),
                Space.yf(.4),
                customTextField(
                  controller: aboutController,
                  maxLines: 4,
                ),
                Space.yf(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Salary",
                    style: AppText.custom,
                  ),
                ),
                Space.yf(.4),
                Container(
                  padding: Space.all(2, .8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.normalize(7),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<CounterCubit>().decrement(context);
                        },
                        child: SvgPicture.asset(
                          AppAssets.decrement,
                        ),
                      ),
                      BlocBuilder<CounterCubit, int>(
                        builder: (context, state) {
                          return Text(
                            "SAR $state",
                            style: AppText.h3,
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<CounterCubit>().increment();
                        },
                        child: SvgPicture.asset(
                          AppAssets.increment,
                        ),
                      )
                    ],
                  ),
                ),
                Space.yf(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Birth Date",
                    style: AppText.custom,
                  ),
                ),
                Space.yf(.4),
                Container(
                  padding: Space.all(1.3, 1),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.normalize(7),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDate == null
                            ? ""
                            : "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}",
                        style: AppText.b2b,
                      ),
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: const Icon(
                          Icons.date_range,
                          color: Colors.grey,
                        ),
                      )
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
                Space.yf(),
                Row(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<SelectGenderCubit>().selectGender(0);
                          },
                          child:
                              BlocBuilder<SelectGenderCubit, SelectGenderState>(
                            builder: (context, state) {
                              return state is GenderSelected &&
                                      state.genderType == 0
                                  ? Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SvgPicture.asset(AppAssets.greenRadio),
                                        SvgPicture.asset(AppAssets.vector),
                                      ],
                                    )
                                  : SvgPicture.asset(AppAssets.greyRadio);
                            },
                          ),
                        ),
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
                        GestureDetector(
                          onTap: () {
                            context.read<SelectGenderCubit>().selectGender(1);
                          },
                          child:
                              BlocBuilder<SelectGenderCubit, SelectGenderState>(
                            builder: (context, state) {
                              return state is GenderSelected &&
                                      state.genderType == 1
                                  ? Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SvgPicture.asset(AppAssets.greenRadio),
                                        SvgPicture.asset(AppAssets.vector),
                                      ],
                                    )
                                  : SvgPicture.asset(AppAssets.greyRadio);
                            },
                          ),
                        ),
                        Space.xf(.5),
                        Text(
                          "Female",
                          style: AppText.h3,
                        )
                      ],
                    )
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
                GestureDetector(
                  onTap: () async {
                    String newSkill = await showDialog(
                      context: context,
                      builder: (context) {
                        return AddSkillDialog();
                      },
                    );
                    if (newSkill.isNotEmpty) {
                      context.read<SkillsCubit>().addSkill(newSkill);
                    }
                  },
                  child: BlocBuilder<SkillsCubit, SkillsState>(
                    builder: (context, state) {
                      return Container(
                        height: AppDimensions.normalize(47),
                        width: double.infinity,
                        padding: Space.all(.8, .6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
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
                              state.skills.length,
                              (index) {
                                return Chip(
                                  padding: Space.all(.3, .3),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        AppDimensions.normalize(5),
                                      ),
                                      side: const BorderSide(
                                          color: Colors.transparent)),
                                  color: MaterialStatePropertyAll(
                                      AppColors.lightGreen),
                                  label: Text(
                                    state.skills[index],
                                    style: AppText.h3?.copyWith(
                                      color: Colors.green.shade300,
                                    ),
                                  ),
                                  deleteIcon: Icon(
                                    Icons.close,
                                    size: AppDimensions.normalize(8),
                                    color: Colors.green.shade300,
                                  ),
                                  onDeleted: () {
                                    context
                                        .read<SkillsCubit>()
                                        .deleteSkill(index);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Space.yf(2),
                BlocBuilder<SelectGenderCubit, SelectGenderState>(
                  builder: (context, genderState) {
                    if (genderState is GenderSelected) {
                      return BlocBuilder<CounterCubit, int>(
                        builder: (context, counterState) {
                          return BlocBuilder<SkillsCubit, SkillsState>(
                            builder: (context, skillsState) {
                              return customElevatedButton(
                                onTap: () {
                                  UserModel userModel = UserModel(
                                      userType: widget.step1user.userType,
                                      password: widget.step1user.password,
                                      lName: widget.step1user.lName,
                                      fName: widget.step1user.fName,
                                      email: widget.step1user.email,
                                      about: aboutController.text.trim(),
                                      birthDate: selectedDate
                                          .toString()
                                          .substring(0, 10),
                                      gender: genderState.genderType,
                                      img: image != null
                                          ? base64String(image!)
                                          : null,
                                      salary: counterState,
                                      skills: skillsState.skills);
                                  injector<HiveHelper>()
                                      .setUserModel(userModel);
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.whoAmI);
                                },
                                text: "Submit",
                                heightFraction: 23,
                                width: double.infinity,
                                color: Colors.green.shade300,
                              );
                            },
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
