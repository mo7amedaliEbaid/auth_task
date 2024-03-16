import 'package:flutter/material.dart';
import '../../presentation/screens.dart';
import '../core.dart';

sealed class AppRouter {


  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
     /* case ads:
        return MaterialPageRoute(builder: (_) => const AdsScreen());
      case choose:
        return MaterialPageRoute(builder: (_) => const ChooseScreen());
      case root:
        return MaterialPageRoute(builder: (_) => const RootScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case restaurant:
        Restaurant restaurant = routeSettings.arguments as Restaurant;
        return MaterialPageRoute(
            builder: (_) => RestaurantScreen(restaurant: restaurant));
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case editProfile:
        CurrentUser currentUser = routeSettings.arguments as CurrentUser;
        return MaterialPageRoute(
            builder: (_) => EditProfileScreen(currentUser: currentUser));
      case changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case filteredRestaurants:
        return MaterialPageRoute(
            builder: (_) => const FilteredRestaurantsScreen());
      case photoView:
        String image = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => PhotoViewScreen(image: image),
        );
      case reservationCheckout:
        Reservation reservation = routeSettings.arguments as Reservation;
        return MaterialPageRoute(
          builder: (_) => ReservationCheckoutScreen(
            reservation: reservation,
          ),
        );
      case successfulBooking:
        return MaterialPageRoute(
            builder: (_) => const SuccessfulBookingScreen());
      case search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case aboutUs:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());
      case privacy:
        return MaterialPageRoute(builder: (_) => const PrivacyScreen());
      case terms:
        return MaterialPageRoute(builder: (_) => const TermsScreen());
      case contactUs:
        return MaterialPageRoute(builder: (_) => const ContactUsScreen());
      case cart:
        Restaurant restaurant = routeSettings.arguments as Restaurant;
        return MaterialPageRoute(
          builder: (_) => CartScreen(
            restaurant: restaurant,
          ),
        );
      case pickupsCheckout:
        final Map<String, dynamic> arguments =
        routeSettings.arguments as Map<String, dynamic>;
        final Restaurant restaurant = arguments['restaurant'] as Restaurant;
        final String amount = arguments['amount'] as String;

        return MaterialPageRoute(
          builder: (_) => PickupsCheckout(
            restaurant: restaurant,
            amount: amount,
          ),
        );*/
      default:
        throw const RouteException('Route not found!');
    }
  }
}
