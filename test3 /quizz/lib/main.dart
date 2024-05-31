import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quizz/constant/list_question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;

  void selectAnswer(int selectedIndex) {
    if (selectedIndex == questions[currentQuestionIndex].correctIndex) {
      // Augmenter le score
    }
    setState(() {
      currentQuestionIndex++;
      if (currentQuestionIndex >= questions.length) {
        // Appel a la fonction qui affiche la pop Up
      }
    });
  }

  void _showScorePopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: ...,
          content: ...,
          actions: ...
      },
    );
  }

  void _resetQuiz() {
    setState(() {
      // mettre index de la question à 0
      // mettre score = 0 
      questions.shuffle(Random());
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= questions.length) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Bonjour Epseed'),
        ),
        body: Center(
          child: Text('Fin du quiz! Votre score est: $score'),
        ),
      );
    } else {
      return Scaffold(
        ...
        ...
        ...,
              // const SizedBox(
              //   height: 20,
              // ),
              // for (var entry in questions[currentQuestionIndex].answers.asMap().entries)
              //   InkWell(
              //     onTap: () => selectAnswer(entry.key),
              //     child: Card(
              //       child: Padding(
              //         padding: const EdgeInsets.all(16.0),
              //         child: Text(entry.value),
              //       ),
              //     ),
              //   ),
              // const SizedBox(height: 20),



              //  pour pouvoir reset le quizz quand on veut :
               
              // OutlinedButton(
              //   onPressed: _resetQuiz,
              //   child: Text('Recommencer le quiz'),
              // ),
            // ],
          // ),
        // ),
      );
    }
  }
}
