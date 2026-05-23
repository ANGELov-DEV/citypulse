import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'feed_screen.dart';
import 'new_post_screen.dart';
import 'chat_screen.dart';
import 'profile_screen.dart';

final class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;

  static const _screens = <Widget>[
    MapScreen(),
    FeedScreen(),
    NewPostScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) => setState(() => _selectedIndex = index),
          backgroundColor: Theme.of(context).colorScheme.surface,
          indicatorColor: const Color(0xFF2563EB).withValues(alpha: 0.15),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.map_outlined),
              selectedIcon: Icon(Icons.map, color: Color(0xFF2563EB)),
              label: 'Карта',
            ),
            NavigationDestination(
              icon: Icon(Icons.list_outlined),
              selectedIcon: Icon(Icons.list, color: Color(0xFF2563EB)),
              label: 'Сигнали',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_circle_outline, size: 32),
              selectedIcon: Icon(Icons.add_circle, color: Color(0xFF2563EB), size: 32),
              label: 'Нов',
            ),
            NavigationDestination(
              icon: Icon(Icons.chat_bubble_outline),
              selectedIcon: Icon(Icons.chat_bubble, color: Color(0xFF2563EB)),
              label: 'Чат',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person, color: Color(0xFF2563EB)),
              label: 'Профил',
            ),
          ],
        ),
      );
}
