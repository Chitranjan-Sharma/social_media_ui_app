import 'package:flutter/material.dart';
import 'package:social_media_ui_app/utils/color_constants.dart';
import 'package:social_media_ui_app/views/screens/tabs/chats_tab.dart';
import 'package:social_media_ui_app/views/screens/tabs/create_post_tab.dart';
import 'package:social_media_ui_app/views/screens/tabs/home_tab.dart';
import 'package:social_media_ui_app/views/screens/tabs/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  List<Widget> tabs = [HomeTab(), CreatePostTab(), ChatsTab(), ProfileTab()];

  backBtn() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: tabs[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorConstants.white,
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          onTap: (value) {
            setState(() {
              _currentTab = value;
            });
          },
          currentIndex: _currentTab,
          showUnselectedLabels: false,
          unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
          selectedLabelStyle:
              TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          unselectedItemColor: Colors.black,
          selectedItemColor: ColorConstants.blueDark,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(label: "HOME", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "POST", icon: Icon(Icons.post_add)),
            BottomNavigationBarItem(
                label: "MESSAGE", icon: Icon(Icons.message)),
            BottomNavigationBarItem(label: "PROFILE", icon: Icon(Icons.person))
          ]),
    );
  }
}
