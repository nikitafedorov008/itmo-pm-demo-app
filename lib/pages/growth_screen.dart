import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agromax/l10n/app_localizations.dart' as l10n;

class GrowthScreen extends StatefulWidget {
  const GrowthScreen({super.key});

  @override
  State<GrowthScreen> createState() => _GrowthScreenState();
}

class _GrowthScreenState extends State<GrowthScreen> {
  @override
  Widget build(BuildContext context) {
    final s = l10n.AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.transparent, // Make scaffold transparent
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Growth Analysis',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Summary cards
              Row(
                children: [
                  Expanded(
                    child: _buildSummaryCard(
                      context,
                      'Growth Rate',
                      '2.5 cm/day',
                      Icons.trending_up_outlined,
                      const Color(0xFF2ECC71),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildSummaryCard(
                      context,
                      'Avg. Height',
                      '45 cm',
                      Icons.straighten_outlined,
                      const Color(0xFFF1C40F),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildSummaryCard(
                      context,
                      'Growth Stage',
                      'Vegetative',
                      Icons.eco_outlined,
                      const Color(0xFF3498DB),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildSummaryCard(
                      context,
                      'Days to Harvest',
                      '42',
                      Icons.calendar_today_outlined,
                      const Color(0xFF9B59B6),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

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
                    Text(
                      'Growth Progress',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 200,
                      child: _buildGrowthChart(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Growth stages
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
                      'Growth Stages',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildGrowthStageItem(
                      'Seeding', 
                      'Day 1-7', 
                      'Planting and initial germination',
                      Icons.nature_outlined,
                      const Color(0xFF2ECC71),
                      true
                    ),
                    const SizedBox(height: 8),
                    _buildGrowthStageItem(
                      'Germination', 
                      'Day 8-14', 
                      'Seedling emergence',
                      Icons.nature_people_outlined,
                      const Color(0xFFF1C40F),
                      true
                    ),
                    const SizedBox(height: 8),
                    _buildGrowthStageItem(
                      'Vegetative', 
                      'Day 15-42', 
                      'Rapid growth phase',
                      Icons.eco_outlined,
                      const Color(0xFF3498DB),
                      true
                    ),
                    const SizedBox(height: 8),
                    _buildGrowthStageItem(
                      'Flowering', 
                      'Day 43-60', 
                      'Flower development',
                      Icons.local_florist_outlined,
                      const Color(0xFFE74C3C),
                      false
                    ),
                    const SizedBox(height: 8),
                    _buildGrowthStageItem(
                      'Harvest', 
                      'Day 61-75', 
                      'Ready for harvest',
                      Icons.grain_outlined,
                      const Color(0xFF9B59B6),
                      false
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Recommendations
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
                      'Recommendations',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildRecommendationItem(
                      'Optimize watering',
                      'Increase watering frequency during vegetative stage',
                      Icons.water_drop_outlined,
                      const Color(0xFF3498DB),
                    ),
                    const SizedBox(height: 8),
                    _buildRecommendationItem(
                      'Nutrient management',
                      'Apply nitrogen-rich fertilizer for rapid growth',
                      Icons.local_florist_outlined,
                      const Color(0xFF2ECC71),
                    ),
                    const SizedBox(height: 8),
                    _buildRecommendationItem(
                      'Pest monitoring',
                      'Monitor for aphids during flowering stage',
                      Icons.bug_report_outlined,
                      const Color(0xFFE74C3C),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, String title, String value, IconData icon, Color color) {
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
            size: 28,
          ),
          const SizedBox(height: 8),
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
              color: const Color(0xFF2C3E50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrowthChart() {
    // This would be replaced with an actual chart widget in a real implementation
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.show_chart_outlined,
            size: 40,
            color: const Color(0xFF3498DB),
          ),
          const SizedBox(height: 8),
          Text(
            'Growth Trend Chart',
            style: TextStyle(
              color: const Color(0xFF7F8C8D),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Height over time',
            style: TextStyle(
              color: const Color(0xFF95A5A6),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrowthStageItem(String title, String timeFrame, String description, IconData icon, Color color, bool isCurrent) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCurrent ? color.withOpacity(0.1) : const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isCurrent ? color : const Color(0xFFE9ECEF),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isCurrent ? color : const Color(0xFFE9ECEF),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              icon,
              color: isCurrent ? Colors.white : color,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isCurrent ? color : const Color(0xFF2C3E50),
                      ),
                    ),
                    if (isCurrent)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Current',
                          style: TextStyle(
                            color: color,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  timeFrame,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF7F8C8D),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF95A5A6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationItem(String title, String description, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE9ECEF)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF7F8C8D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}