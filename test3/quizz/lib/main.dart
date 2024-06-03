import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quizz/constant/list_question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;

  void selectAnswer(int selectedIndex) {
    if (selectedIndex == questions[currentQuestionIndex].correctIndex) {
      ...
    }
    setState(() {
      currentQuestionIndex++;
      if (currentQuestionIndex >= questions.length) {
        ...
      }
    });
  }

  void _showScorePopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            // title: ...,
            // content: ...,
            // actions: ...
            );
      },
    );
  }

  void _resetQuiz() {
    setState(() {
      ...
      questions.shuffle(Random());
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= questions.length) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Recommencer le quizz ?'),
        ),
        body: Center(
          child: OutlinedButton(
            onPressed: _resetQuiz,
            child: const Text('Recommencer le quizz'),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            for (var entry
                in questions[currentQuestionIndex].answers.asMap().entries)
              InkWell(
                onTap: () => selectAnswer(entry.key),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(entry.value),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: _resetQuiz,
              child: const Text('Recommencer le quizz'),
            ),
          ],
        ),
      );
    }
  }
}
