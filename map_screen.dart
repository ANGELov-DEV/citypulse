import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/signal_data.dart';

final class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _mapController = MapController();
  var _activeFilters = SignalCategory.values.toSet();

  static const _initialCenter = LatLng(42.6977, 23.3219);

  // Временни тестови данни (ще се заменят със Supabase)
  static final _signals = <SignalData>[
    const SignalData(
      category: SignalCategory.traffic,
      position: LatLng(42.6977, 23.3219),
      title: 'Задръстване',
    ),
    const SignalData(
      category: SignalCategory.police,
      position: LatLng(42.6950, 23.3250),
      title: 'Проверка до НДК',
    ),
    const SignalData(
      category: SignalCategory.promo,
      position: LatLng(42.7000, 23.3180),
      title: '-30% в Lidl',
    ),
  ];

  void _toggleFilter(SignalCategory category) => setState(() {
        _activeFilters.contains(category)
            ? _activeFilters.remove(category)
            : _activeFilters.add(category);
      });

  void _goToCurrentLocation() => _mapController.move(_initialCenter, 14);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset('assets/logo.png', width: 20, height: 20),
              ),
              const SizedBox(width: 10),
              const Text('CityPulse', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        body: Stack(
          children: [
            // Карта
            FlutterMap(
              mapController: _mapController,
              options: const MapOptions(
                initialCenter: _initialCenter,
                initialZoom: 13,
                minZoom: 5,
                maxZoom: 18,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.citypulse.app',
                ),
                MarkerLayer(
                  markers: _signals
                      .where((s) => _activeFilters.contains(s.category))
                      .map((signal) => Marker(
                            point: signal.position,
                            width: 80,
                            height: 80,
                            child: GestureDetector(
                              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(signal.title),
                                  duration: const Duration(seconds: 2),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.location_on, color: signal.category.color, size: 36),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                                    ),
                                    child: Text(signal.category.label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),

            // Бутон за локация
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: _goToCurrentLocation,
                backgroundColor: const Color(0xFF2563EB),
                child: const Icon(Icons.my_location, color: Colors.white),
              ),
            ),

            // Филтри
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: SignalCategory.values.map((cat) => _buildChip(cat)).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildChip(SignalCategory category) {
    final isActive = _activeFilters.contains(category);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: FilterChip(
        label: Text(category.fullLabel, style: const TextStyle(fontSize: 12)),
        selected: isActive,
        onSelected: (_) => _toggleFilter(category),
        selectedColor: category.color.withValues(alpha: 0.2),
        checkmarkColor: category.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}