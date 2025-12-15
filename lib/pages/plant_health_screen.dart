import 'package:flutter/material.dart';
import 'package:agromax/l10n/app_localizations.dart' as l10n;

class PlantHealthScreen extends StatelessWidget {
  const PlantHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = l10n.AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.transparent, // Make scaffold transparent
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Plant description
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Live Basil plant gives freshness and flavor.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF2C3E50),
                      ),
                    ),
                  ],
                ),
              ),
              // Plant health metrics
              Row(
                children: [
                  Expanded(
                    child: _buildHealthMetricCard(
                      context,
                      title: "Plant's Health",
                      value: '94%',
                      reference: 'Of reference value',
                      icon: Icons.favorite_outlined,
                      color: const Color(0xFF2ECC71),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildHealthMetricCard(
                      context,
                      title: 'Growth Rate',
                      value: '75%',
                      reference: 'Of reference value',
                      icon: Icons.trending_up_outlined,
                      color: const Color(0xFF3498DB),
                    ),
                  ),
                ],
              ),
              // Days to harvest
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: const Color(0xFF3498DB),
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '30 days to harvest',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2C3E50),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 8,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE9ECEF),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Container(
                                width: 30,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2ECC71),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '45/75',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: const Color(0xFF7F8C8D),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Growth chart
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
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
                          'Growth Rate',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2C3E50),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Week',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: const Color(0xFF3498DB),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Month',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: const Color(0xFF95A5A6),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Year',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: const Color(0xFF95A5A6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 150,
                      child: Stack(
                        children: [
                          // Grid lines
                          CustomPaint(
                            size: const Size(double.infinity, 150),
                            painter: _GrowthChartPainter(),
                          ),
                          // Data points and lines
                          Positioned.fill(
                            child: Row(
                              children: [
                                _buildChartDataPoint(context, 0.8, 'Sat'),
                                _buildChartDataPoint(context, 0.6, 'Sun'),
                                _buildChartDataPoint(context, 0.9, 'Mon'),
                                _buildChartDataPoint(context, 0.7, 'Tue'),
                                _buildChartDataPoint(context, 1.0, 'Wed'),
                                _buildChartDataPoint(context, 0.85, 'Thu'),
                                _buildChartDataPoint(context, 0.95, 'Fri'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Current weather
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cloudy',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '28°C',
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF2ECC71),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3498DB).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.cloud_outlined,
                            size: 40,
                            color: Color(0xFF3498DB),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Hourly forecast
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          final hour = ['9AM', '10AM', '12PM', '1PM', '2PM', '3PM'][index];
                          final temp = [28, 29, 30, 31, 30, 29][index];
                          return Container(
                            margin: const EdgeInsets.only(right: 12),
                            width: 60,
                            decoration: BoxDecoration(
                              color: index == 0 ? const Color(0xFF3498DB).withOpacity(0.1) : const Color(0xFFF8F9FA),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  hour,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: index == 0 ? const Color(0xFF3498DB) : const Color(0xFF7F8C8D),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '$temp°C',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: index == 0 ? const Color(0xFF3498DB) : const Color(0xFF2C3E50),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Additional weather info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildWeatherInfoCard(
                    context,
                    icon: Icons.brightness_5_outlined,
                    title: 'UV Index',
                    value: '0.5',
                  ),
                  _buildWeatherInfoCard(
                    context,
                    icon: Icons.water_drop_outlined,
                    title: 'Humidity',
                    value: '75%',
                  ),
                  _buildWeatherInfoCard(
                    context,
                    icon: Icons.air_outlined,
                    title: 'Wind',
                    value: '12 km/h',
                  ),
                ],
              ),
              const SizedBox(height: 112),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherInfoCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String value,
      }) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 24,
            color: const Color(0xFF3498DB),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: const Color(0xFF7F8C8D),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthMetricCard(
      BuildContext context, {
        required String title,
        required String value,
        required String reference,
        required IconData icon,
        required Color color,
      }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 28,
            color: color,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: const Color(0xFF7F8C8D),
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            reference,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: const Color(0xFF95A5A6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartDataPoint(BuildContext context, double heightFactor, String day) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 6,
            height: 100 * heightFactor,
            decoration: BoxDecoration(
              color: const Color(0xFF3498DB),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            day,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: const Color(0xFF7F8C8D),
            ),
          ),
        ],
      ),
    );
  }
}

class _GrowthChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFECF0F1)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    // Draw horizontal grid lines
    for (int i = 1; i <= 4; i++) {
      final y = size.height * (i / 5);
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}