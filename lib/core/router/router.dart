import 'package:flutter/material.dart';
import 'package:mohamed_ali/data/data.dart';
import '../../presentation/screens.dart';
import '../core.dart';

sealed class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case AppRoutes.completeData:
        Step1User step1user = routeSettings.arguments as Step1User;
        return MaterialPageRoute(
          builder: (_) => CompleteDataScreen(
            step1user: step1user,
          ),
        );

      case AppRoutes.root:
        return MaterialPageRoute(builder: (_) => const RootScreen());
      case AppRoutes.whoAmI:
        return MaterialPageRoute(builder: (_) => const WhoAmIScreen());
      case AppRoutes.services:
        return MaterialPageRoute(builder: (_) => const ServicesScreen());
      case AppRoutes.countries:
        return MaterialPageRoute(builder: (_) => const CountriesScreen());

      default:
        throw const RouteException('Route not found!');
    }
  }
}
