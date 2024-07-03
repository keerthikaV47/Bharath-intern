import 'package:flutter/material.dart';

class RectangularButton extends StatelessWidget {
  const RectangularButton({
    super.key,
    required this.onPressed,
    required this.label,
  });
  final VoidCallback? onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: SizedBox(
          height: 50,
          width: 150,
          child: Card(
            color: onPressed != null
                ? const Color.fromARGB(255, 7, 172, 153)
                : Color.fromARGB(255, 112, 194, 184),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  letterSpacing: 2,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ));
  }
}
