// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AppDevelopmentPage extends StatefulWidget {
  const AppDevelopmentPage({super.key});

  @override
  _AppDevelopmentPageState createState() => _AppDevelopmentPageState();
}

class _AppDevelopmentPageState extends State<AppDevelopmentPage> {
  int _currentQuestionIndex = 0;
  List<String?> _selectedAnswers = [];
  List<bool> _correctAnswers = [];
  final List<Question> _questions = [
    Question(
      questionText: 'What motivates you more?',
      options: [
        'Building something entirely new and innovative.',
        'Taking an existing concept and improving it for efficiency.'
      ],
      correctAnswer: 'Building something entirely new and innovative.',
    ),
    Question(
      questionText: 'How do you handle risk?',
      options: [
        "I'm comfortable with calculated risks and potential for high rewards.",
        "I prefer stability and minimize unnecessary risks."
      ],
      correctAnswer:
          "I'm comfortable with calculated risks and potential for high rewards.",
    ),
    Question(
      questionText: 'How do you react to setbacks?',
      options: [
        "I see them as learning opportunities and quickly change if needed.",
        "I take time to analyze the problem and develop a corrective plan."
      ],
      correctAnswer:
          'I see them as learning opportunities and quickly change if needed.',
    ),
    Question(
      questionText: 'What is your preferred work environment?',
      options: [
        "Fast-paced, dynamic, and constantly changing.",
        "Structured, predictable, and results-oriented."
      ],
      correctAnswer: 'Fast-paced, dynamic, and constantly changing.',
    ),
    Question(
      questionText: 'How do you approach decision-making?',
      options: [
        "I rely on intuition and adapt based on new data.",
        "I gather information and analyze options before making a decision."
      ],
      correctAnswer: 'I rely on intuition and adapt based on new data.',
    ),
    Question(
      questionText: 'Do you crave novelty and innovation?',
      options: [
        "Absolutely! Building something entirely new is exciting.",
        "I value proven concepts, but I'm open to improvements."
      ],
      correctAnswer: 'Absolutely! Building something entirely new is exciting.',
    ),
    Question(
      questionText: 'How do you handle challenges?',
      options: [
        "I see them as opportunities to learn and adapt quickly.",
        "I take time to analyze the problem and develop a solution."
      ],
      correctAnswer: 'I see them as opportunities to learn and adapt quickly.',
    ),
    Question(
      questionText: 'What is your ideal work environment?',
      options: [
        "Fast-paced, dynamic, and constantly evolving.",
        "Structured, predictable, and results-oriented."
      ],
      correctAnswer: 'Fast-paced, dynamic, and constantly evolving.',
    ),
    Question(
      questionText: 'How do you make decisions?',
      options: [
        "I follow my intuition and adapt based on new information.",
        "I gather data and analyze options before making a choice."
      ],
      correctAnswer:
          'I follow my intuition and adapt based on new information.',
    ),
    Question(
      questionText: 'What motivates you more?',
      options: [
        "The potential for high rewards and significant impact.",
        "Creating a stable, efficient, and profitable business."
      ],
      correctAnswer: 'The potential for high rewards and significant impact.',
    ),
    Question(
      questionText:
          'Imagine you have a super cool idea for a new way to help people. What\'s the first thing you should do?',
      options: [
        "Build a quick example of your idea and show it to people who might use it to see if they like it.",
        "Do some research to find out if other people have this problem and write a long plan about your business."
      ],
      correctAnswer:
          'Build a quick example of your idea and show it to people who might use it to see if they like it.',
    ),
    Question(
      questionText: 'Your company\'s sales are going down. How can you fix it?',
      options: [
        "Try new ways to advertise and come up with creative ideas to sell more.",
        "Look at your sales numbers to see what's wrong and try to make things run smoother."
      ],
      correctAnswer:
          'Try new ways to advertise and come up with creative ideas to sell more.',
    ),
    Question(
      questionText:
          'You don\'t have a lot of money to advertise your product. What should you do?',
      options: [
        "Use free or cheap ways to advertise like social media.",
        "Pay to advertise to the exact people who would want your product and make sure it makes you money."
      ],
      correctAnswer: 'Use free or cheap ways to advertise like social media.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Initialize _selectedAnswers and _correctAnswers based on _questions length
    _selectedAnswers = List<String?>.filled(_questions.length, '');
    _correctAnswers = List<bool>.filled(_questions.length, false);

    // Shuffle options for each question
    for (var question in _questions) {
      question.shuffleOptions();
    }
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _showResults();
    }
  }

  void _showResults() {
    int points = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_selectedAnswers[i] == _questions[i].correctAnswer) {
        points++;
      }
    }

    String result;
    if (points >= 7 && points <= 11) {
      result =
          'Your mindset leans towards a Startup. You thrive in ambiguity, embrace risk, and prioritize innovation.';
    } else if (points >= 4 && points <= 6) {
      result =
          'Your mindset aligns more with a Business. You value stability, prioritize efficiency, and focus on building upon existing models.';
    } else {
      result =
          'This quiz is a starting point. Consider exploring resources on developing an entrepreneurial mindset regardless of your chosen path.';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Results'),
        content: Text(
          result,
          style: const TextStyle(color: Color(0xffeca731)),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _currentQuestionIndex = 0;
                _selectedAnswers = List<String?>.filled(_questions.length, '');
                _correctAnswers = List<bool>.filled(_questions.length, false);
                for (var question in _questions) {
                  question.shuffleOptions();
                }
              });
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
        title: Text(
          'Enterpreneurial Mindset Quiz',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Question ${_currentQuestionIndex + 1}/${_questions.length}',
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffeca731)),
                ),
                const SizedBox(height: 20),
                Text(
                  _questions[_currentQuestionIndex].questionText,
                  style:
                      const TextStyle(fontSize: 18, color: Color(0xffeca731)),
                ),
                const SizedBox(height: 20),
                ..._questions[_currentQuestionIndex].options.map((option) {
                  return RadioListTile<String?>(
                    title: Text(
                      option!,
                      style: TextStyle(
                        color: _selectedAnswers[_currentQuestionIndex] == option
                            ? Colors.blue
                            : Colors.black,
                      ),
                    ),
                    value: option,
                    groupValue: _selectedAnswers[_currentQuestionIndex],
                    onChanged: (String? value) {
                      setState(() {
                        _selectedAnswers[_currentQuestionIndex] = value!;
                        _correctAnswers[_currentQuestionIndex] =
                            _questions[_currentQuestionIndex].correctAnswer ==
                                value;
                      });
                    },
                  );
                }),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    // primary: Color(0xffeca731),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(_currentQuestionIndex < _questions.length - 1
                      ? 'Next'
                      : 'Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  List<String?> options;
  final String correctAnswer;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });

  // Method to shuffle options randomly
  void shuffleOptions() {
    options.shuffle();
  }
}
