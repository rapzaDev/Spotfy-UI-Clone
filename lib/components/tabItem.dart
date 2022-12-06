// ignore_for_file: file_names

import 'package:flutter/material.dart';

enum TabItem { home, search, library, profile }

const Map<TabItem, String> tabName = {
  TabItem.home: 'Home',
  TabItem.search: 'Search',
  TabItem.library: 'Your Library',
  TabItem.profile: 'Profile'
};

const Map<TabItem, Icon> tabIcon = {
  TabItem.home: Icon(Icons.home_outlined),
  TabItem.search: Icon(Icons.search_outlined),
  TabItem.library: Icon(Icons.library_music),
  TabItem.profile: Icon(Icons.person)
};
