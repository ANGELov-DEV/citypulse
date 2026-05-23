import 'package:flutter/material.dart';

final class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Сигнали наблизо')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.list_alt, size: 80, color: Color(0xFF2563EB)),
              const SizedBox(height: 20),
              Text('Сигналите ще се зареждат от базата данни', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text('Свързване със Supabase...', style: TextStyle(color: Colors.grey[500])),
            ],
          ),
        ),
      );
}