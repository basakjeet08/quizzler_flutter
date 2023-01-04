import 'package:flutter/material.dart';

class QuizBrain {

  // Variable which stores the questions
  final List<String> _questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
    'Some cats are actually allergic to humans',
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
    'Buzz Aldrin\'s mother\'s maiden name was "Moon".',
    'It is illegal to pee in the Ocean in Portugal.',
    'No piece of square dry paper can be folded in half more than 7 times.',
    'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
    'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
    'The total surface area of two human lungs is approximately 70 square metres.',
    'Google was originally called "Back rub".',
    'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
    'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
  ];

  // Variable which stores the answers
  final List<bool> _answers = [
    false,
    true,
    true,
    true,
    false,
    true,
    true,
    true,
    true,
    false,
    true,
    false,
    true,
    true,
    true,
    true
  ];

  // Variable which stores the current Position of question
  int _position = 0;

  // Variable which stores the score of the User
  int _score = 0;

  // Variable which stores the Icon list which will be displayed at the bottom of the screen
  final List<Icon> _quizIcons = [];

  // This function returns the current Question
  String getCurrentQuestion() {
    return _questions[_position];
  }

  // This function checks the answer and add Icons to the _quizIcons variable accordingly
  void checkAnswer(bool choice) {
    if (choice == _answers[_position]) {
      _quizIcons.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
      _score++;
    } else {
      _quizIcons.add(const Icon(
        Icons.close,
        color: Colors.red,
      ));
    }

    // This function updates the position variable which keeps the current position of the question
    _updatePosition();
  }

  // This function updates the current position of the variable
  void _updatePosition() {
    if (_position != _questions.length - 1) {
      _position++;
    }
  }

  // This function returns a true or false if the Quiz is finished or not
  bool quizCompleted() {
    if (_position == _questions.length - 1) {
      return true;
    }
    return false;
  }

  // This function returns the current quizIcons variable which have all the icons to be showed at the bottom of app
  List<Icon> getIcons() => _quizIcons;

  // This app gives the current Score of the User
  int getScore() => _score;

  // This function is used to reset the Quiz and restart the Quiz
  void resetQuiz() {
    _position = 0;
    _quizIcons.clear();
    _score = 0;
  }
}
