import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    Key? key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
  }) : super(key: key);

  final String question;
  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex && isSelected;
    bool isWrongAnswer = isSelected && !isCorrectAnswer;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(60, 7, 7, 7),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            width: 2,
            color: isCorrectAnswer
                ? Colors.green
                : isWrongAnswer
                    ? Colors.red
                    : Color.fromARGB(255, 7, 172, 153),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                question,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            isCorrectAnswer
                ? buildCorrectIcon()
                : isWrongAnswer
                    ? buildWrongIcon()
                    : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

Widget buildCorrectIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );

Widget buildWrongIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Color.fromARGB(255, 219, 12, 12),
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
