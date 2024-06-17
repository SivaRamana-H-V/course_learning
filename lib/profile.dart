// ignore_for_file: unnecessary_import, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
        backgroundColor: const Color(0xffeca731),
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xfffdfdfd)),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 380,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                color: Color(0xffeca731),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Zunaira Shoaib',
                    style: TextStyle(color: Color(0xfffdfdfd), fontSize: 26),
                  ),
                  const Text(
                    'Software Engineer',
                    style: TextStyle(color: Color(0xfffdfdfd), fontSize: 17),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 17),
                        text:
                            "Software Engineer | Flutter Developer | Firebase | API's | Artificial Intelligence AND Machine learning Enthusiast",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 400,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditProfilePage()),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profile'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 400,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AchievementsPage()),
                  );
                },
                icon: const Icon(Icons.emoji_events),
                label: const Text('View Achievements'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 400,
              child: ElevatedButton.icon(
                onPressed: () {
                  _showLogoutDialog();
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 400,
              child: ElevatedButton.icon(
                onPressed: () {
                  _showDeleteAccountDialog();
                },
                icon: const Icon(Icons.delete),
                label: const Text('Delete Account'),
                style: ElevatedButton.styleFrom(
                    // primary: Colors.red,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text(
            'Are you sure you want to logout?',
            style: TextStyle(color: Color(0xffeca731)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Perform logout operation
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text(
            'Are you sure you want to delete your account? This action cannot be undone.',
            style: TextStyle(color: Color(0xffeca731)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Perform delete account operation
              },
              child: const Text('Delete'),
              style: TextButton.styleFrom(
                  // primary: Colors.red
                  ),
            ),
          ],
        );
      },
    );
  }
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: const Color(0xffeca731),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Occopation',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Bio',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement save profile functionality
                },
                style: ElevatedButton.styleFrom(
                    // primary: Color(0xffeca731),
                    ),
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AchievementsPage extends StatelessWidget {
  final List<String> achievements = [
    'Completed Flutter Course',
    'Completed HTML Course',
    'Completed CSS Course',
    'Completed JavaScript Course',
    'Completed Python Course',
    'Completed Java Course',
    'Completed Flutter Course',
    'Completed HTML Course',
    'Completed CSS Course',
    'Completed JavaScript Course',
    'Completed Python Course',
    'Completed Java Course',
  ];

  AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
        title: Text(
          'Achievements',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: const Color(0xffeca731),
      ),
      body: ListView.builder(
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                achievements[index],
                style: const TextStyle(color: Color(0xffeca731), fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}
