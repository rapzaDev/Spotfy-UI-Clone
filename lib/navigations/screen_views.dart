import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:spotfy_ui_clone/views/Home/home.dart';
import 'package:spotfy_ui_clone/views/library.dart';
import 'package:spotfy_ui_clone/views/profile.dart';
import 'package:spotfy_ui_clone/views/search.dart';

class ScreenViews extends StatefulWidget {
  const ScreenViews({super.key});

  @override
  State<ScreenViews> createState() => _ScreenViewsState();
}

class _ScreenViewsState extends State<ScreenViews> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: "Your Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: Stack(
        children: [
          renderView(0, const HomeView()),
          renderView(1, const LibraryView()),
          renderView(2, const ProfileView()),
          renderView(3, const SearchView()),
        ],
      ),
    );
  }

  Widget renderView(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: _selectedTab != tabIndex,
      child: Opacity(
        opacity: _selectedTab == tabIndex ? 1 : 0,
        child: view,
      ),
    );
  }
}
