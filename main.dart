import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const CityPulseApp());

final class CityPulseApp extends StatelessWidget {
  const CityPulseApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'CityPulse',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2563EB),
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Color(0xFF2563EB),
            foregroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2563EB),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFF1A1A2E),
        ),
        themeMode: ThemeMode.system,
        home: const HomeScreen(),
      );
}