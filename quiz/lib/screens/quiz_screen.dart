import 'package:flutter/material.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/screens/result_screen.dart';
import 'package:quiz/widgets/answer_card.dart';
import 'package:quiz/widgets/next_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    setState(() {
      selectedAnswerIndex = value;
      final question = questions[questionIndex];
      if (selectedAnswerIndex == question.correctAnswerIndex) {
        score++;
      }
    });
  }

  void goToNextQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
        selectedAnswerIndex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 172, 153),
        title: Center(
          child: const Text('Quiz app',
              style:
                  TextStyle(fontSize: 21, color: Color.fromARGB(255, 6, 6, 6))),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                question.question,
                style: const TextStyle(fontSize: 21, color: Colors.white),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: selectedAnswerIndex == null
                      ? () => pickAnswer(index)
                      : null,
                  child: AnswerCard(
                    currentIndex: index,
                    question: question.options[index],
                    isSelected: selectedAnswerIndex == index,
                    selectedAnswerIndex: selectedAnswerIndex,
                    correctAnswerIndex: question.correctAnswerIndex,
                  ),
                );
              },
            ),
            isLastQuestion
                ? RectangularButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => ResultScreen(
                                score: score,
                              )));
                    },
                    label: 'Finish')
                : RectangularButton(
                    onPressed:
                        selectedAnswerIndex != null ? goToNextQuestion : null,
                    label: 'Next')
          ],
        ),
      ),
    );
  }
}
