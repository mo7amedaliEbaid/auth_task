import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed_ali/core/core.dart';
import 'package:mohamed_ali/cubits/cubits.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("Token = ${injector<HiveHelper>().getToken()}");
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => SelectGenderCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Auth Task',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRoutes.login,
        theme: ThemeData(
          fontFamily: AppStrings.fontFamily,
          scaffoldBackgroundColor: AppColors.scaffoldBackground,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.greenColor,
          ),
        ),
      ),
    );
  }
}
