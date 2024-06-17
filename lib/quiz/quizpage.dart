// ignore_for_file: unused_import, unnecessary_import, camel_case_types

import 'package:course_learning/auth/enroll.dart';
import 'package:course_learning/quiz/appdevelopment.dart';
import 'package:course_learning/quiz/cplusplus.dart';
import 'package:course_learning/quiz/css.dart';
import 'package:course_learning/quiz/html.dart';
import 'package:course_learning/quiz/java.dart';
import 'package:course_learning/quiz/javascript.dart';
import 'package:course_learning/quiz/python.dart';
import 'package:course_learning/quiz/sql.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class quizPage extends StatefulWidget {
  const quizPage({super.key});

  @override
  State<quizPage> createState() => _quizPageState();
}

class _quizPageState extends State<quizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
        title: Text(
          'Take a quiz',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AppDevelopmentPage(),
                        ));
                  },
                  child: Container(
                    height: 150,
                    width: 350,
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
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.business_center_rounded,
                          size: 50,
                          color: Colors.black,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Enterpreneurial Mindset Quiz',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        )
                      ],
                    ),
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
