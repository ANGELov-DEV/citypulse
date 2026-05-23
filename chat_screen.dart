import 'package:flutter/material.dart';

final class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Квартален чат')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.chat_bubble_outline, size: 80, color: Color(0xFF8B5CF6)),
              const SizedBox(height: 20),
              Text('Свържи се със съседите', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text('Чатът ще бъде достъпен във Фаза 2', style: TextStyle(color: Colors.grey[500])),
            ],
          ),
        ),
      );
}