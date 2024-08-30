import 'package:flutter/material.dart';
import 'package:movie_app/core/strings/images.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/screens/home/tabs/browse_tab.dart';
import 'package:movie_app/screens/home/tabs/home_tab.dart';
import 'package:movie_app/screens/home/tabs/search_tab.dart';
import 'package:movie_app/screens/home/tabs/watchList_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.primaryColor,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              isSelected = true;
              setState(() {});
            },
            //  showSelectedLabels: isSelected ? true : false,
            items: [
              BottomNavigationBarItem(
                  label: isSelected ? "HOME" : "",
                  backgroundColor: MyColor.bkGroundBottomNavColor,
                  icon: const ImageIcon(
                    AssetImage(
                      MyImages.homeIcon,
                    ),
                  )),
              BottomNavigationBarItem(
                  label: isSelected ? "SEARCH" : "",
                  icon: const ImageIcon(AssetImage(
                    MyImages.searchIcon,
                  ))),
              BottomNavigationBarItem(
                  label: isSelected ? "BROWSE" : "",
                  icon: const ImageIcon(AssetImage(
                    MyImages.browseIcon,
                  ))),
              BottomNavigationBarItem(
                  label: isSelected ? "WATCHLIST" : "",
                  icon: const ImageIcon(AssetImage(
                    MyImages.watchlistIcon,
                  ))),
            ]),
        body: tabs[selectedIndex]);
  }

  List<Widget> tabs = const [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchlistTab(),
  ];
}
