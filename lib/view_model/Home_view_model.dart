
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../events_screen.dart';
import '../filter.dart';
import '../user_home.dart';
import '../user_profile.dart';
import '../widget_Org/Add_event.dart';
import '../widget_Org/home_org.dart';

class HomeViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget currentScreen = const Home();
  Widget currentScreen2 = const HomeOrg();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        currentScreen = const Home();
        break;
      case 1:
        currentScreen = const EventsScreen();
        break;
      case 2:
        currentScreen = const FilterEventsScreen();
        break;
      case 3:
        currentScreen = const ProfileScreen();
        break;
      default:
        currentScreen = const Home();
    }
    update(); //
    print(currentScreen);
  }

  void changeSelectedValue_org(int selectedValue2) {
    _navigatorValue = selectedValue2;
    switch (selectedValue2) {
      case 0:
        currentScreen2 = const HomeOrg();
        break;
      case 1:
        currentScreen2 = const EventsScreen();
        break;
      case 2:
        currentScreen2 =  AddEvent();
        break;
      case 3:
        currentScreen2 = const FilterEventsScreen();
        break;
      case 4:
        currentScreen2 = const ProfileScreen();
      default:
        currentScreen2 = const Home();
    }
    update(); //
    print(currentScreen2);
  }
}
