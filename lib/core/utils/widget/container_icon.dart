import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/extensions/styles.dart';

Widget SocialButton(
    BuildContext context, {
      String? asset,
      required String label,
      required VoidCallback onTap,
    }) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(asset!=null)
            Image.asset(
              asset,
              height: 20,
              width: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: context.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
