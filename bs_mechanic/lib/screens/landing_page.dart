import 'package:bs_mechanic/screens/history_page.dart';
import 'package:bs_mechanic/screens/landing_home_page.dart';
import 'package:bs_mechanic/screens/profile_page.dart';
import 'package:bs_mechanic/screens/status_page.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:bs_mechanic/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    LandingHomePage(),
    StatusPage(),
    HistoryPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGrey,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: textWhite,
          selectedItemBorderColor: purple,
          selectedItemBackgroundColor: purple,
          selectedItemIconColor: textWhite,
          selectedItemLabelColor: purple,
          showSelectedItemShadow: false
        ),
        selectedIndex: _selectedIndex,
        onSelectTab: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.houseChimney,
            label: "Home",
          ),
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.clipboardList,
            label: "Status",
          ),
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.list,
            label: "History",
          ),
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.user,
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
