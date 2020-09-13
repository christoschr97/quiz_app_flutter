import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'question': 'Whats your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 2},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'question': 'Whats your favorite profesor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Luke', 'score': 5},
        {'text': 'Green', 'score': 2},
        {'text': 'Statham', 'score': 10},
      ],
    },
    {
      'question': 'Whos your favorite animal?',
      'answers': [
        {'text': 'Rabit', 'score': 10},
        {'text': 'Parrot', 'score': 5},
        {'text': 'Dog', 'score': 20},
        {'text': 'Cat', 'score': 1},
      ],
    },
  ];

  void _answerQuestion(int score) {
    if (_questionIndex > _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions!');
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
      _totalScore += score;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
