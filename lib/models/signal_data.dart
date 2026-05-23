import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

enum SignalCategory {
  police('Полиция', '🚔 Полиция', Color(0xFF2563EB)),
  traffic('Трафик', '🚗 Трафик', Color(0xFFF59E0B)),
  danger('Опасност', '⚠️ Опасност', Color(0xFFEF4444)),
  incident('Инцидент', '🔥 Инцидент', Color(0xFFDC2626)),
  promo('Промоции', '💸 Промоции', Color(0xFF10B981)),
  scam('Измама', '🚨 Измама', Color(0xFF8B5CF6)),
  outage('Авария', '💧 Авария', Color(0xFF0EA5E9)),
  news('Новина', '📰 Новина', Color(0xFF14B8A6)),
  question('Въпрос', '❓ Въпрос', Color(0xFF6B7280));

  const SignalCategory(this.label, this.fullLabel, this.color);

  final String label;
  final String fullLabel;
  final Color color;
}

final class SignalData {
  final SignalCategory category;
  final LatLng position;
  final String title;

  const SignalData({
    required this.category,
    required this.position,
    required this.title,
  });
}
