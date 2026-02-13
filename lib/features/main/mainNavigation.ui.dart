import 'package:cherry/features/main/allmatches/allMatches.ui.dart';
import 'package:cherry/features/main/mymatches/myMatches.ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sficon/flutter_sficon.dart';

class Mainnavigation extends StatefulWidget {
  const Mainnavigation({super.key});

  @override
  State<Mainnavigation> createState() => _MainnavigationState();
}

class _MainnavigationState extends State<Mainnavigation> {
  int _currentNavigationIndex = 0;
  final List<Widget> _dashboardPages = [MyMatchesScreen(), AllMatchesScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "CHERRY",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color(0xFF1A3263),
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentNavigationIndex,
        children: _dashboardPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentNavigationIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {
            _currentNavigationIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(SFIcons.sf_sportscourt_fill),
            label: 'My Matches',
            icon: Icon(SFIcons.sf_sportscourt),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(SFIcons.sf_globe_americas_fill),
            label: 'All Matches',
            icon: Icon(SFIcons.sf_globe_americas),
          ),
        ],
      ),
    );
  }
}
