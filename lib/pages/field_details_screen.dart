import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldDetailsScreen extends StatefulWidget {
  const FieldDetailsScreen({super.key});

  @override
  State<FieldDetailsScreen> createState() => _FieldDetailsScreenState();
}

class _FieldDetailsScreenState extends State<FieldDetailsScreen> {
  late MapController mapController;
  bool _showDetails = false;
  int _selectedZone = 1;
  bool _showNDVIOptions = false;
  int _selectedMapType = 0;

  // Координаты центра Агрофирмы "Выборжец" в Всеволожском районе
  final LatLng _fieldCenter = const LatLng(60.075, 30.450);

  // Детальные координаты для полигонов зон поля (указаны по часовой стрелке для правильной заливки)
  final List<LatLng> _zone1 = [
    const LatLng(60.081, 30.442),
    const LatLng(60.086, 30.448),
    const LatLng(60.085, 30.458),
    const LatLng(60.082, 30.465),
    const LatLng(60.078, 30.462),
    const LatLng(60.076, 30.452),
  ];

  final List<LatLng> _zone2 = [
    const LatLng(60.073, 30.438),
    const LatLng(60.078, 30.442),
    const LatLng(60.079, 30.452),
    const LatLng(60.077, 30.460),
    const LatLng(60.072, 30.458),
    const LatLng(60.070, 30.448),
  ];

  final List<LatLng> _zone3 = [
    const LatLng(60.066, 30.440),
    const LatLng(60.071, 30.445),
    const LatLng(60.072, 30.455),
    const LatLng(60.069, 30.462),
    const LatLng(60.064, 30.460),
    const LatLng(60.063, 30.450),
  ];

  final List<LatLng> _zone4 = [
    const LatLng(60.083, 30.435),
    const LatLng(60.088, 30.440),
    const LatLng(60.089, 30.450),
    const LatLng(60.087, 30.458),
    const LatLng(60.084, 30.455),
    const LatLng(60.082, 30.445),
  ];

  final List<LatLng> _zone5 = [
    const LatLng(60.068, 30.430),
    const LatLng(60.073, 30.435),
    const LatLng(60.074, 30.445),
    const LatLng(60.072, 30.453),
    const LatLng(60.067, 30.450),
    const LatLng(60.066, 30.440),
  ];

  final List<LatLng> _zoneCenters = [
    const LatLng(60.081, 30.455),  // Zone 1
    const LatLng(60.073, 30.450),  // Zone 2
    const LatLng(60.066, 30.457),  // Zone 3
    const LatLng(60.084, 30.445),  // Zone 4
    const LatLng(60.068, 30.445),  // Zone 5
  ];

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLegendItem(context, 'High', const Color(0xFF2ECC71)),
                _buildLegendItem(context, 'Medium', const Color(0xFFF1C40F)),
                _buildLegendItem(context, 'Low', const Color(0xFFE74C3C)),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Vsevolozhsky District, Agrofirm "Vyborgets"',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Карта с полигонами
          Expanded(
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: _fieldCenter,
                initialZoom: 14.0,
                maxZoom: 18.0,
                minZoom: 10.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName: 'com.example.agromax',
                ),
                // Полигоны зон с правильной заливкой согласно документации
                PolygonLayer(
                  // Используем правильный метод заливки для идеального отображения
                  // painterFillMethod: PolygonPainterFillMethod.pathCombine,
                  // Отключаем симплификацию для точной отрисовки сложных полигонов
                  // simplificationTolerance: 0.0,
                  polygons: [
                    // Зона 1 - Высокая урожайность
                    Polygon(
                      points: _zone1,
                      borderColor: const Color(0xFF27AE60).withAlpha(80),
                      // ИСПРАВЛЕНО: Яркая, насыщенная заливка без прозрачности
                      color: const Color(0xFF2ECC71).withAlpha(80), // Полностью непрозрачный цвет
                      borderStrokeWidth: 2.0,
                      // Гарантируем заливку внутренней области
                      isFilled: true,
                    ),
                    // Зона 2 - Средняя урожайность
                    Polygon(
                      points: _zone2,
                      borderColor: const Color(0xFFF39C12).withAlpha(80),
                      color: const Color(0xFFF1C40F).withAlpha(80), // Полностью непрозрачный цвет
                      borderStrokeWidth: 2.0,
                      isFilled: true,
                    ),
                    // Зона 3 - Низкая урожайность
                    Polygon(
                      points: _zone3,
                      borderColor: const Color(0xFFC0392B).withAlpha(80),
                      color: const Color(0xFFE74C3C).withAlpha(80), // Полностью непрозрачный цвет
                      borderStrokeWidth: 2.0,
                      isFilled: true,
                    ),
                    // Зона 4 - Дополнительная зона высокой урожайности
                    Polygon(
                      points: _zone4,
                      borderColor: const Color(0xFF27AE60).withAlpha(80),
                      color: const Color(0xFF2ECC71).withAlpha(80),
                      borderStrokeWidth: 2.0,
                      isFilled: true,
                    ),
                    // Зона 5 - Дополнительная зона средней урожайности
                    Polygon(
                      points: _zone5,
                      borderColor: const Color(0xFFD35400).withAlpha(80),
                      color: const Color(0xFFF1C40F).withAlpha(80),
                      borderStrokeWidth: 2.0,
                      isFilled: true,
                    ),
                  ],
                ),
                // Маркеры для центров зон
                MarkerLayer(
                  markers: List.generate(5, (index) {
                    final zoneNumber = index + 1;
                    final colors = [
                      const Color(0xFF2ECC71), // Zone 1 - зеленый
                      const Color(0xFFF1C40F), // Zone 2 - желтый
                      const Color(0xFFE74C3C), // Zone 3 - красный
                      const Color(0xFF2ECC71), // Zone 4 - зеленый
                      const Color(0xFFF1C40F), // Zone 5 - желтый
                    ];
                    final borderColors = [
                      const Color(0xFF27AE60),
                      const Color(0xFFF39C12),
                      const Color(0xFFC0392B),
                      const Color(0xFF27AE60),
                      const Color(0xFFD35400),
                    ];

                    return Marker(
                      width: 60,
                      height: 60,
                      point: _zoneCenters[index],
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedZone = zoneNumber;
                            _showDetails = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: borderColors[index],
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Z$zoneNumber',
                              style: TextStyle(
                                color: borderColors[index],
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                // Маркер для агрофирмы
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 100,
                      height: 100,
                      point: _fieldCenter,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Agrofirm',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF3498DB),
                              ),
                            ),
                            Text(
                              'Vyborgets',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF3498DB),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: const Color(0xFF3498DB),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Панель управления NDVI
          if (_showNDVIOptions)
            _buildNDVIControlPanel(context),

          // Панель деталей зоны
          if (_showDetails)
            _buildZoneDetailsPanel(context),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (!_showNDVIOptions && !_showDetails)
            FloatingActionButton(
              onPressed: () {
                mapController.move(_fieldCenter, 14.0);
              },
              foregroundColor: Theme.of(context).primaryIconTheme.color,
              backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.6),
              child: Icon(Icons.my_location,),
            ),
          if (!_showNDVIOptions && !_showDetails)
            const SizedBox(height: 16),
          if (!_showNDVIOptions && !_showDetails)
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _showNDVIOptions = true;
                });
              },
              backgroundColor: const Color(0xFF2ECC71).withValues(alpha: 0.6),
              child: const Icon(Icons.map_outlined),
            ),
        ],
      ),
    );
  }

  // Остальные методы (_buildNDVIControlPanel, _buildMapTypeButton, _buildZoneDetailsPanel, etc.)
  // остаются без изменений
  Widget _buildNDVIControlPanel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12,12,12,112,),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Map Type Selection',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2C3E50),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _showNDVIOptions = false;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Типы карт
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildMapTypeButton(context, 'NDVI Map', 0, Icons.map_outlined),
                _buildMapTypeButton(context, 'Contrast NDVI', 1, Icons.gradient_outlined),
                _buildMapTypeButton(context, 'Field Zones', 2, Icons.layers_outlined),
                _buildMapTypeButton(context, 'Soil Analysis', 3, Icons.terrain_outlined),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Сезон и культура
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE9ECEF)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined, size: 20, color: Color(0xFF3498DB)),
                      const SizedBox(width: 8),
                      Text(
                        'Season 2024',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF2C3E50),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE9ECEF)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.agriculture_outlined, size: 20, color: Color(0xFF2ECC71)),
                      const SizedBox(width: 8),
                      Text(
                        'Wheat',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF2C3E50),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Кнопки действий
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3498DB),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Save Settings'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _showNDVIOptions = false;
                      _showDetails = true;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: const BorderSide(color: Color(0xFF3498DB)),
                  ),
                  child: const Text('Field Analysis'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMapTypeButton(BuildContext context, String label, int value, IconData icon) {
    final isSelected = _selectedMapType == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMapType = value;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3498DB).withOpacity(0.1) : const Color(0xFFF8F9FA),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF3498DB) : const Color(0xFFE9ECEF),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF3498DB) : const Color(0xFF7F8C8D),
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? const Color(0xFF3498DB) : const Color(0xFF2C3E50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildZoneDetailsPanel(BuildContext context) {
    final zoneColors = [
      const Color(0xFF2ECC71), // Zone 1 - зеленый
      const Color(0xFFF1C40F), // Zone 2 - желтый
      const Color(0xFFE74C3C), // Zone 3 - красный
      const Color(0xFF2ECC71), // Zone 4 - зеленый
      const Color(0xFFF1C40F), // Zone 5 - желтый
    ];

    final zoneData = [
      {'name': 'Northern Zone', 'yield': '5.2 t/ha', 'health': '92%', 'area': '12.5 ha'},
      {'name': 'Central Zone', 'yield': '4.8 t/ha', 'health': '85%', 'area': '10.2 ha'},
      {'name': 'Southern Zone', 'yield': '3.9 t/ha', 'health': '72%', 'area': '8.7 ha'},
      {'name': 'Eastern Zone', 'yield': '5.0 t/ha', 'health': '88%', 'area': '9.8 ha'},
      {'name': 'Western Zone', 'yield': '4.5 t/ha', 'health': '80%', 'area': '11.3 ha'},
    ];

    final currentZone = zoneData[_selectedZone - 1];
    final currentColor = zoneColors[_selectedZone - 1];

    return Container(
      padding: const EdgeInsets.fromLTRB(16,16,16,112),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${currentZone['name']} Analysis',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: currentColor,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _showDetails = false;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Vsevolozhsky District, Leningrad Region',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          // Основные метрики
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMetricCard(
                context,
                title: 'Yield',
                value: currentZone['yield']!,
                icon: Icons.grain_outlined,
                color: currentColor,
              ),
              _buildMetricCard(
                context,
                title: 'Health',
                value: currentZone['health']!,
                icon: Icons.favorite_outlined,
                color: currentColor,
              ),
              _buildMetricCard(
                context,
                title: 'Area',
                value: currentZone['area']!,
                icon: Icons.crop_outlined,
                color: currentColor,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Прогресс состояния
          Text(
            'Field Condition',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: double.parse(currentZone['health']!.substring(0, 2)) / 100,
            backgroundColor: Colors.grey.shade200,
            color: currentColor,
            minHeight: 10,
            borderRadius: BorderRadius.circular(5),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Plant health status',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                currentZone['health'] ?? 'health',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: currentColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Кнопки действий
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3498DB).withOpacity(0.1),
                    foregroundColor: const Color(0xFF3498DB),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_comment_outlined, size: 20),
                      SizedBox(width: 8),
                      Text('Add Note'),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: currentColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.analytics_outlined, size: 20),
                      SizedBox(width: 8),
                      Text('Analysis'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildZoneMarker(BuildContext context, String label, Color textColor, Color circleColor) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: circleColor,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  Widget _buildLegendItem(BuildContext context, String label, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color(0xFF2C3E50),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(
      BuildContext context, {
        required String title,
        required String value,
        required IconData icon,
        required Color color,
      }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}