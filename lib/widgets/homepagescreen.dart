// ignore_for_file: unused_import, unnecessary_import, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:course_learning/Notification/notification.dart';
import 'package:course_learning/auth/enroll.dart';
import 'package:course_learning/booksshop/books.dart';
import 'package:course_learning/courses.dart';
import 'package:course_learning/courses/html.dart';
import 'package:course_learning/dashboard.dart';
import 'package:course_learning/form/discussion.dart';
import 'package:course_learning/profile.dart';
import 'package:course_learning/quiz/quizpage.dart';
import 'package:course_learning/widgets/category.dart';
import 'package:course_learning/widgets/customsearchbar.dart';
import 'package:course_learning/widgets/roadmap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart'; // Add this import statement
import 'package:shared_preferences/shared_preferences.dart';

class homePageScreen extends StatefulWidget {
  const homePageScreen({super.key});

  @override
  State<homePageScreen> createState() => _homePageScreenState();
}

class _homePageScreenState extends State<homePageScreen> {
  @override
  void initState() {
    super.initState();
    _trackUsage();
  }

  Future<void> _trackUsage() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    final today = formatter.format(now);

    // Increment the count for today
    final usageCount = prefs.getInt(today) ?? 0;
    await prefs.setInt(today, usageCount + 1);

    // Save the last opened time
    await prefs.setString('last_opened', now.toIso8601String());
  }

  final List<Map<String, dynamic>> items = [
    {
      'title': 'Courses',
      'icon': Icons.video_collection_outlined,
      'color': Colors.pinkAccent,
      'route': const coursesPage(),
    },
    // {
    //   'title': 'Quiz',
    //   'icon': Icons.menu_book_sharp,
    //   'color': Colors.lightBlueAccent,
    //   'route': const quizPage(),
    // },
    {
      'title': 'Resources',
      'icon': Icons.architecture,
      'color': Colors.purple.shade600,
      'route': AchievementsPage(),
    },
    {
      'title': 'Help Desk',
      'icon': Icons.help_center_rounded,
      'color': Colors.yellow.shade900,
      'route': DiscussionScreen(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 35, color: Color(0xfffdfdfd)),
        centerTitle: true,
        title: const Text(
          'Startup Culture',
          style: TextStyle(
              // color: Color(0xfffdfdfd),
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        backgroundColor: const Color(0xffeca731),
        actions: [
          const Icon(
            Icons.notifications_none_outlined,
            size: 35,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffeca731),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'assets/profile.jpg',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Siva',
                        style:
                            TextStyle(color: Color(0xfffdfdfd), fontSize: 28),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.import_contacts_rounded,
              ),
              title: const Text('Courses'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.interests_rounded,
              ),
              title: const Text('Resources'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.video_collection_rounded,
              ),
              title: const Text('Exposure Videos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.file_present_rounded,
              ),
              title: const Text('Student & Study'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_rounded,
              ),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => items[index]['route'],
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: items[index]['color'],
                          ),
                          child: Icon(
                            items[index]['icon'],
                            size: 40,
                            color: const Color(0xfffdfdfd),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          items[index]['title'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Courses',
                  style: TextStyle(color: Color(0xffeca731)),
                ),
                const SizedBox(
                  width: 180,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const coursesPage(),
                        ));
                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(color: Color(0xffeca731)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 160,
                      decoration: BoxDecoration(
                        color: const Color(0xffeca731),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.business_center_rounded,
                            size: 100,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Learn HTML3',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xffeca731),
                                fontWeight: FontWeight.normal),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const htmlPage()));
                            },
                            child: const Text(
                              'Enroll Now',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 200,
                      width: 160,
                      decoration: BoxDecoration(
                        color: const Color(0xffeca731),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.auto_awesome_mosaic_rounded,
                            size: 100,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Learn CSS3',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xffeca731),
                                fontWeight: FontWeight.normal),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EnrollmentForm()));
                            },
                            child: const Text(
                              'Enroll Now',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
