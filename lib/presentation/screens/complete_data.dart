import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohamed_ali/core/core.dart';
import 'package:mohamed_ali/configs/configs.dart';
import 'package:mohamed_ali/cubits/cubits.dart';
import 'package:mohamed_ali/presentation/widgets.dart';

class CompleteDataScreen extends StatefulWidget {
  const CompleteDataScreen({super.key});

  @override
  State<CompleteDataScreen> createState() => _CompleteDataScreenState();
}

class _CompleteDataScreenState extends State<CompleteDataScreen> {
  TextEditingController aboutController = TextEditingController();
  DateTime? selectedDate;

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
                Image.asset(
                  AppAssets.addImage,
                  height: AppDimensions.normalize(35),
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

                      ],
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
