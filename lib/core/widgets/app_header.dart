import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Icon(Icons.delete_outline, color: Colors.blue),
            const SizedBox(width: 8),
            const Text(
              "CityCleaner",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            const Spacer(),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.orange.shade100,
              child: const Icon(Icons.person, color: Colors.orange),
            )
          ],
        ),
      ),
    );
  }
}
