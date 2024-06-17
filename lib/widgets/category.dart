import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Web Development',
      'description': 'Learn to build websites and web applications.',
      'icon': Icons.web,
    },
    {
      'title': 'App Development',
      'description': 'Create mobile applications for Android and iOS.',
      'icon': Icons.phone_android,
    },
    {
      'title': 'Data Structure and Algorithms',
      'description':
          'Master the fundamentals of data structures and algorithms.',
      'icon': Icons.memory,
    },
    {
      'title': 'Digital Marketing',
      'description': 'Learn strategies to market products and services online.',
      'icon': Icons.mark_email_read,
    },
    {
      'title': 'Graphic Designing',
      'description': 'Design visually appealing graphics and layouts.',
      'icon': Icons.design_services,
    },
    {
      'title': 'Video Editing',
      'description': 'Edit and produce professional quality videos.',
      'icon': Icons.video_call,
    },
  ];

  CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
        title: Text(
          'Learning Categories',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(category['icon'], size: 40, color: const Color(0xffeca731)),
              title: Text(
                category['title'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(category['description']),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle category tap
              },
            ),
          );
        },
      ),
    );
  }
}
