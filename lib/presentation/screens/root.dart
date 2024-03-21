import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mohamed_ali/configs/configs.dart';
import 'package:mohamed_ali/core/core.dart';
import 'package:mohamed_ali/presentation/screens.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: selectedIndex == 0
          ? const WhoAmIScreen()
          : selectedIndex == 1
              ?  CountriesScreen()
              : const ServicesScreen(),
      bottomNavigationBar: SizedBox(
        height: AppDimensions.normalize(25),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 15,
          selectedItemColor: Colors.green.shade300,
          unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.user,
                colorFilter: ColorFilter.mode(
                  selectedIndex == 0 ? Colors.green.shade300 : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Who Am I',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.countries,
                colorFilter: ColorFilter.mode(
                  selectedIndex == 1 ? Colors.green.shade300 : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Countries',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.services,
                colorFilter: ColorFilter.mode(
                  selectedIndex == 2 ? Colors.green.shade300 : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Services',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
