// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class DiscussionScreen extends StatefulWidget {
  @override
  _DiscussionScreenState createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  final List<Map<String, String>> _messages = [
    {'user': 'User1', 'text': 'Hello, how are you?'},
    {'user': 'User2', 'text': 'I am good, thanks!'},
    {'user': 'User1', 'text': 'What are you working on?'},
    {'user': 'User2', 'text': 'Just a Flutter project.'},
  ];

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    setState(() {
      _messages.add({'user': 'Me', 'text': _messageController.text});
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
        title: Text(
          'Discussion Forum',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isMe = message['user'] == 'Me';
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      if (!isMe)
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Text(message['user']![0]),
                        ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: isMe ? const Color(0xffeca731) : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message['user']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isMe ? const Color(0xfffdfdfd) : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              message['text']!,
                              style: TextStyle(
                                color: isMe ? const Color(0xfffdfdfd) : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (isMe)
                        CircleAvatar(
                          backgroundColor: const Color(0xffeca731),
                          child: Text('Me'[0]),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      labelText: 'Message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: _sendMessage,
                  backgroundColor: const Color(0xffeca731),
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
