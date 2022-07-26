import 'package:clean_arch/prsentation/main/pages/home_page.dart';
import 'package:clean_arch/prsentation/main/pages/notifications_page.dart';
import 'package:clean_arch/prsentation/main/pages/search_page.dart';
import 'package:clean_arch/prsentation/main/pages/settings_page.dart';
import 'package:clean_arch/prsentation/resources/color_manager.dart';
import 'package:clean_arch/prsentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  final page = [
    HomePage(),
    SearchPage(),
    NotificationsPage(),
    SettingsPage()
  ];

  final titles = [
    AppStrings.home,
    AppStrings.search,
    AppStrings.notifications,
    AppStrings.settings,
  ];

  int _currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_currentIndex]),
      ),
      body: page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(items:  [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined,),label: AppStrings.home),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: AppStrings.search),
        BottomNavigationBarItem(icon: Icon(Icons.notifications),label: AppStrings.notifications),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: AppStrings.settings),
      ],
        selectedItemColor: ColorManager.primary,
        showSelectedLabels: true,
        currentIndex: _currentIndex,
        unselectedItemColor: ColorManager.grey,

        onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        },

      ),
    );
  }
}
