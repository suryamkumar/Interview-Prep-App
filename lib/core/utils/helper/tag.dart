import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/extensions/styles.dart';

import '../../palletes/colors/colors.dart';
class TagChip extends StatelessWidget {
  final String text;

  const TagChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: kPrimary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: context.bodySmall.copyWith(
          color: kPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
