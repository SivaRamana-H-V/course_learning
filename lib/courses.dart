import 'package:course_learning/courses/html.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class coursesPage extends StatefulWidget {
  const coursesPage({super.key});

  @override
  State<coursesPage> createState() => _coursesPageState();
}

// ignore: camel_case_types
class _coursesPageState extends State<coursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
        backgroundColor: const Color(0xffeca731),
        title: const Text(
          'Courses',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xfffdfdfd)),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
                        'Course 1',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const htmlPage()));
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
                        'Course 2',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const htmlPage()));
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
          ],
        ),
      ),
    );
  }
}
