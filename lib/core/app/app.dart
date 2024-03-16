import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed_ali/core/core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("Token = ${injector<HiveHelper>().getToken()}");
    return MultiBlocProvider(
      providers: [
        /* BlocProvider(
          create: (context) => AuthBloc(
            authRepository: context.read<AuthRepository>(),
          )..add(InitializeAuthEvent()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => UserBloc(
            authBloc: context.read<AuthBloc>(),
            userRepository: context.read<UserRepository>(),
          )..add(StartUserEvent()),
        ),
        BlocProvider(
          create: (context) =>
              SignUpBloc(authRepository: context.read<AuthRepository>()),
        ),
        BlocProvider(
          create: (context) => SignInBloc(
            authRepository: context.read<AuthRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => ConnectivityCubit(),
        ),
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
            lazy: false,
            create: (context) =>
            RestaurantsBloc(restaurantsRepository: RestaurantsRepo())
              ..add(LoadRestaurants())),
        BlocProvider(
          create: (context) => FilterCubit(
            repository: RestaurantsRepo(),
          ),
        ),
        BlocProvider(
            lazy: false,
            create: (context) =>
            TagsBloc(restaurantsRepository: RestaurantsRepo())
              ..add(LoadTags())),
        BlocProvider(
          create: (context) => SelectTagCubit(),
        ),
        BlocProvider(
          create: (context) => PickupCubit(
            pickupRepo: PickupsRepo(),
          ),
        ),
        BlocProvider(
          create: (context) => SearchCubit(
            repository: RestaurantsRepo(),
          ),
        ),
        BlocProvider(
          create: (context) => AddReservationCubit(
            reservationsRepository: ReservationRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => GetReservationsCubit(
            reservationsRepository: ReservationRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => CartCubit(
            CartRepository(),
          ),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => AboutUsBloc(
            AboutRepo(),
          )..add(
            GetAboutUsEvent(),
          ),
        ),
        BlocProvider(
          create: (context) => PlaceOrderCubit(
            ordersRepository: OrdersRepository(),
          ),
        ),*/
      ],
      child: MaterialApp(
        title: 'Garcon',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRoutes.login,
        theme: ThemeData(
            fontFamily: AppStrings.fontFamily,
            dialogTheme: const DialogTheme(
              backgroundColor: Colors.white,
            )),
      ),
    );
  }
}
