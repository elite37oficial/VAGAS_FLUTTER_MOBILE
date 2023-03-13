import 'package:flutter/material.dart';

class VacancyDetailText extends StatelessWidget {
  final option_text;
  final description_text;
  const VacancyDetailText(
      {super.key, required this.option_text, required this.description_text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          option_text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.normal,
          ),
        ),
        Text(
          description_text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
