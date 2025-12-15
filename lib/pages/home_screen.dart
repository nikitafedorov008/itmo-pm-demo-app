import 'package:flutter/material.dart';
import 'package:agromax/l10n/app_localizations.dart' as l10n;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = l10n.AppLocalizations.of(context)!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Field status mini map section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        s.fieldStatus,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: const Color(0xFF2C3E50),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.map_outlined,
                          color: Color(0xFF3498DB),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Field Details screen using the route
                      // Also could use the FieldNavigationNotifier if needed for state management
                      Navigator.pushNamed(context, '/field-details');
                    },
                    child: Container(
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
                          // Mini map preview
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F7F4),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFE1E8E6),
                                width: 1,
                              ),
                            ),
                            child: Stack(
                              children: [
                                // Background field pattern
                                Positioned.fill(
                                  child: CustomPaint(
                                    painter: FieldPatternPainter(),
                                  ),
                                ),
                                // Zone indicators
                                Positioned(
                                  top: 30,
                                  left: 40,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF2ECC71).withValues(alpha: 0.8),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: const Color(0xFF27AE60),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 80,
                                  left: 90,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF1C40F).withValues(alpha: 0.8),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: const Color(0xFFF39C12),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 50,
                                  left: 150,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE74C3C).withValues(alpha: 0.8),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: const Color(0xFFC0392B),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                // Center location indicator
                                Positioned(
                                  top: 75,
                                  left: 120,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF3498DB),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  ),
                                ),
                                // Title overlay
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color(0xFFE1E8E6),
                                      ),
                                    ),
                                    child: Text(
                                        'Vsevolozhsky District, Field #3',
                                      // s.location, // Using the location term from localization
                                      style: TextStyle(
                                        color: const Color(0xFF2C3E50),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Summary information
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildFieldSummaryItem(s.high, /*'High'*/ 3, const Color(0xFF2ECC71)),
                              _buildFieldSummaryItem(s.medium, /*'Medium',*/ 2, const Color(0xFFF1C40F)),
                              _buildFieldSummaryItem(s.low, /*'Low',*/ 1, const Color(0xFFE74C3C)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Quick access section
              Text(
                s.quickAccess, // 'Quick Access',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: const Color(0xFF2C3E50),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildQuickAccessCard(
                      context,
                      icon: Icons.map_outlined,
                      title: s.fieldDetailsTitle, // 'Details Field',
                      color: const Color(0xFF3498DB),
                      onTap: () {
                        Navigator.pushNamed(context, '/details-field');
                      },
                    ),
                    _buildQuickAccessCard(
                      context,
                      icon: Icons.auto_graph_outlined,
                      title: s.growth, // 'Growth',
                      color: const Color(0xFF2ECC71),
                      onTap: () {
                        Navigator.pushNamed(context, '/growth');
                      },
                    ),
                    _buildQuickAccessCard(
                      context,
                      icon: Icons.science_outlined,
                      title: 'Опыты', // s.experiments, // 'Experiments',
                      color: const Color(0xFF9B59B6),
                      onTap: () {
                        Navigator.pushNamed(context, '/experiments');
                      },
                    ),
                    _buildQuickAccessCard(
                      context,
                      icon: Icons.analytics_outlined,
                      title: s.weeklyInsights, // 'Weekly Insights',
                      color: const Color(0xFFF39C12),
                      onTap: () {
                        Navigator.pushNamed(context, '/weekly-insights');
                      },
                    ),
                    _buildQuickAccessCard(
                      context,
                      icon: Icons.local_florist_outlined,
                      title: s.soilAnalysis, // 'Soil Analysis',
                      color: const Color(0xFF9B59B6),
                      onTap: () {
                        Navigator.pushNamed(context, '/soil-analysis');
                      },
                    ),
                    _buildQuickAccessCard(
                      context,
                      icon: Icons.bug_report_outlined,
                      title: s.pestControl, // 'Pest Control',
                      color: const Color(0xFFE67E22),
                      onTap: () {
                        Navigator.pushNamed(context, '/pest-disease');
                      },
                    ),
                    _buildQuickAccessCard(
                      context,
                      icon: Icons.rotate_right_outlined,
                      title: s.cropRotation, //'Crop Rotation',
                      color: const Color(0xFF1ABC9C),
                      onTap: () {
                        Navigator.pushNamed(context, '/crop-rotation');
                      },
                    ),
                  ],
                ),
              ),
              // Recent activities section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    s.recentActivities, // 'Recent Activities',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: const Color(0xFF2C3E50),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
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
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8F9FA),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFFE9ECEF),
                                  width: 1,
                                ),
                              ),
                              child: const Icon(
                                Icons.edit_outlined,
                                color: Color(0xFF3498DB),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  s.fieldReportUpdated, // 'Field Report Updated',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF2C3E50),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  s.updatedNDVIAnalysis, // 'Updated NDVI analysis for Field #3',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: const Color(0xFF7F8C8D),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              '2ч назад', // '2h ago',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                color: const Color(0xFF95A5A6),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 24,
                          thickness: 1,
                          color: Color(0xFFECF0F1),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8F9FA),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFFE9ECEF),
                                  width: 1,
                                ),
                              ),
                              child: const Icon(
                                Icons.notifications_active_outlined,
                                color: Color(0xFF2ECC71),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  s.weatherAlert, // 'Weather Alert',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF2C3E50),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  s.heavyRainExpected, // 'Heavy rain expected tomorrow',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: const Color(0xFF7F8C8D),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              '5ч назад', // '5h ago',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                color: const Color(0xFF95A5A6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                s.agriculturalTools, // 'Agricultural Tools',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: const Color(0xFF2C3E50),
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Soil Analysis Card
              _buildFeatureCard(
                context,
                title: s.soilAnalysisActionTitle, // 'Soil Analysis',
                subtitle: s.soilAnalysisAction, // 'Analyze soil composition and nutrients',
                icon: Icons.local_florist_outlined,
                color: const Color(0xFF9B59B6),
                onTap: () {
                  Navigator.pushNamed(context, '/soil-analysis');
                },
              ),
              // Pest & Disease Card
              _buildFeatureCard(
                context,
                title: s.pestDisease, // 'Pest & Disease',
                subtitle: s.detectManageCropPests, // 'Detect and manage crop pests',
                icon: Icons.bug_report_outlined,
                color: const Color(0xFFE67E22),
                onTap: () {
                  Navigator.pushNamed(context, '/pest-disease');
                },
              ),
              // Crop Rotation Card
              _buildFeatureCard(
                context,
                title: s.cropRotation, // 'Crop Rotation',
                subtitle: s.planSustainableCropRotation, // 'Plan sustainable crop rotation',
                icon: Icons.rotate_right_outlined,
                color: const Color(0xFF1ABC9C),
                onTap: () {
                  Navigator.pushNamed(context, '/crop-rotation');
                },
              ),
              // Fertilizer Calculator Card
              _buildFeatureCard(
                context,
                title: s.fertilizerCalculator, // 'Fertilizer Calculator',
                subtitle: s.calculateOptimalFertilizerAmounts, // 'Calculate optimal fertilizer amounts',
                icon: Icons.calculate_outlined,
                color: const Color(0xFF3498DB),
                onTap: () {
                  Navigator.pushNamed(context, '/fertilizer-calculator');
                },
              ),
              // Irrigation Scheduler Card
              _buildFeatureCard(
                context,
                title: s.irrigationScheduler, // 'Irrigation Scheduler',
                subtitle: s.planManageIrrigationSchedules, // 'Plan and manage irrigation schedules',
                icon: Icons.water_drop_outlined,
                color: const Color(0xFF2ECC71),
                onTap: () {
                  Navigator.pushNamed(context, '/irrigation-scheduler');
                },
              ),
              SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAccessCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required Color color,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2C3E50),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildFeatureCard(
      BuildContext context,
      {
        required String title,
        required String subtitle,
        required IconData icon,
        required Color color,
        required VoidCallback onTap,
      }
      ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF7F8C8D),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: const Color(0xFF95A5A6),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldSummaryItem(String label, int count, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '$label: $count',
          style: TextStyle(
            color: const Color(0xFF7F8C8D),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class FieldPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw a grid pattern to represent field areas
    final gridSize = 20.0;
    final gridPaint = Paint()
      ..color = const Color(0xFFD5E8D4).withValues(alpha: 0.3)
      ..strokeWidth = 1.0;

    for (double x = 0; x <= size.width; x += gridSize) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        gridPaint,
      );
    }

    for (double y = 0; y <= size.height; y += gridSize) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}