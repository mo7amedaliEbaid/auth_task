import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohamed_ali/core/core.dart';
import 'package:mohamed_ali/configs/configs.dart';
import 'package:mohamed_ali/cubits/salary_counter/counter_cubit.dart';
import 'package:mohamed_ali/presentation/widgets.dart';

class CompleteDataScreen extends StatefulWidget {
  const CompleteDataScreen({super.key});

  @override
  State<CompleteDataScreen> createState() => _CompleteDataScreenState();
}

class _CompleteDataScreenState extends State<CompleteDataScreen> {
  TextEditingController aboutController = TextEditingController();

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
                aboutTextField(controller: aboutController),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
