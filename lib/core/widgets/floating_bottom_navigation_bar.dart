import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../modules/home/ui/screens/home_screen.dart';
import '../../modules/notifications/ui/screens/notifications_screen.dart';
import '../../modules/profile/ui/screens/profile_screen.dart';
import '../../modules/settings/ui/screens/settings_screen.dart';


class FloatingBottomNavigationBar extends StatefulWidget {
  const FloatingBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<FloatingBottomNavigationBar> createState() => _FloatingBottomNavigationBarState();
}

class _FloatingBottomNavigationBarState extends State<FloatingBottomNavigationBar> {
  int screenIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const NotificationsScreen(),
    const SettingsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  Stack(
        children: [
          _screens.elementAt(screenIndex),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Align(
              alignment: const Alignment(0.0,1.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(14.r)),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    elevation: 0,
                    backgroundColor: Colors.white12,
                    currentIndex: screenIndex,
                    selectedItemColor: Colors.blue,
                    unselectedItemColor: Colors.grey[400],
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    iconSize: 24.sp,
                    selectedFontSize: 11.sp,
                    unselectedFontSize: 9.sp,
                    onTap: (index) {
                      setState(() {
                        screenIndex = index;
                      });
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.notifications),
                        label: 'Notifications',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Settings',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}