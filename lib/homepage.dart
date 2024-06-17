// ignore_for_file: unused_field, unnecessary_import, camel_case_types, use_super_parameters, prefer_const_constructors

import 'package:course_learning/courses.dart';
import 'package:course_learning/courses/html.dart';
import 'package:course_learning/profile.dart';
import 'package:course_learning/widgets/homepagescreen.dart';
import 'package:course_learning/widgets/roadmap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late PageController _pageController;
  late int _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab = 0;
    _pageController = PageController(initialPage: _selectedTab);
  }

  final List _pages = [
    homePageScreen(),
    coursesPage(),
    RoadmapPage(),
    ProfilePage(),
    htmlPage(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Color(0xffeca731),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined), label: "Courses"),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment_sharp), label: "Resources"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_3_outlined), label: "Profile"),
        ],
      ),
    );
  }
}
