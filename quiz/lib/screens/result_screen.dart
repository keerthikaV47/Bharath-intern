import 'package:flutter/material.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/screens/quiz_screen.dart';
import 'package:quiz/widgets/next_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score,
  });

  final int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            const Text(
              'your score',
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 7, 172, 153)),
            ),
            SizedBox(
              height: 50,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 12,
                    value: score / 9,
                    color: const Color.fromARGB(255, 7, 172, 153),
                    backgroundColor: Color.fromARGB(255, 20, 20, 20),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      score.toString() + "/6",
                      style: const TextStyle(fontSize: 80, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${(score / questions.length * 100).round()}%',
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            RectangularButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => QuizScreen(),
                    ),
                  );
                },
                label: 'RESTART')
          ],
        ),
      ),
    );
  }
}
