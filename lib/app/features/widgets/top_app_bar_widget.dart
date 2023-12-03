import 'package:flutter/material.dart';

class TopAppBarWidget extends StatelessWidget {
  final List<Widget> widgets;
  const TopAppBarWidget({super.key, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF4CAF50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Column(
              children: widgets,
            ),
          ],
        ),
      ),
    );
  }
}
