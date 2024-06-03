import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questions = [
    Question(
      title: 'What is Flutter?',
      description: 'Choose the best description of Flutter.',
      options: [
        'A bird',
        'A programming language',
        'A mobile SDK',
        'A game',
        'An IDE'
      ],
    ),
    Question(
      title: 'What is Dart?',
      description: 'Choose the best description of Dart.',
      options: [
        'A sport',
        'A programming language',
        'A mobile SDK',
        'A game',
        'An IDE'
      ],
    ),
    Question(
      title: 'Who developed Flutter?',
      description: 'Choose the best answer.',
      options: ['Microsoft', 'Facebook', 'Google', 'Apple', 'Amazon'],
    ),
    Question(
      title: 'Which platform does Flutter support?',
      description: 'Choose the correct options.',
      options: ['iOS', 'Android', 'Web', 'Desktop', 'All of the above'],
    ),
    Question(
      title: 'What is the main programming language used for Flutter?',
      description: 'Choose the correct answer.',
      options: ['Java', 'Kotlin', 'Swift', 'Dart', 'JavaScript'],
    ),
  ];

  Map<int, String> selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return QuestionWidget(
                    question: questions[index],
                    questionIndex: index,
                    onOptionSelected: (String answer) {
                      setState(() {
                        selectedAnswers[index] = answer;
                      });
                    },
                    selectedAnswer: selectedAnswers[index],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle submit logic here
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Submit Quiz'),
                      content:
                          Text('Are you sure you want to submit the quiz?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            // Implement submission logic
                          },
                          child: Text('Submit'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15), backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String title;
  final String description;
  final List<String> options;

  Question({
    required this.title,
    required this.description,
    required this.options,
  });
}

class QuestionWidget extends StatelessWidget {
  final Question question;
  final int questionIndex;
  final ValueChanged<String> onOptionSelected;
  final String? selectedAnswer;

  QuestionWidget({
    required this.question,
    required this.questionIndex,
    required this.onOptionSelected,
    this.selectedAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              question.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            for (var option in question.options)
              RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: selectedAnswer,
                onChanged: (value) {
                  if (value != null) {
                    onOptionSelected(value);
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
