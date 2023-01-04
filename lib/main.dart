import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(padding: EdgeInsets.all(10.0), child: QuizPage()),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  // Object of QuizBrain class which have most of the quiz Logic and all the stuff working behind
  QuizBrain quizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(

                // Calling the getCurrentQuestion() to get the current question of the game
                quizBrain.getCurrentQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)),
          onPressed: () {
            setState(() {

              // Checking if the Answer is correct or not
              quizBrain.checkAnswer(true);
            });

            // Adding an alert when we reach at the End of the Question
            if (quizBrain.quizCompleted()) {
              Alert(
                  context: context,
                  title: "Quiz Finished",
                  desc: 'Your Score is ${quizBrain.getScore()} ')
                  .show();
              quizBrain.resetQuiz();
            }
          },
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'True',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          onPressed: () {
            setState(() {

              // Calling the checkAnswer function to check if the answer is correct
              quizBrain.checkAnswer(false);
            });

            // showing an Alert if we just finished the last question of the Quiz
            if (quizBrain.quizCompleted()) {
              Alert(
                  context: context,
                  title: "Quiz Finished",
                  desc: 'Your Score is ${quizBrain.getScore()} ')
                  .show();
              quizBrain.resetQuiz();
            }
          },
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'False',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(

          // Getting the icons from the quizBrain class which have a function getIcons which returns icons List
          children: quizBrain.getIcons(),
        )
      ],
    );
  }
}
