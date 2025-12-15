import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgriculturalDashboardScreen extends StatelessWidget {
  const AgriculturalDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Make scaffold transparent
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile widget before Agricultural Tools
              _buildProfileCard(context),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Text(
                  'Quick Access',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF2C3E50),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // Soil Analysis Card
              _buildFeatureCard(
                context,
                title: 'Soil Analysis',
                subtitle: 'Analyze soil composition and nutrients',
                icon: Icons.local_florist_outlined,
                color: const Color(0xFF9B59B6),
                onTap: () {
                  Navigator.pushNamed(context, '/soil-analysis');
                },
              ),
              const SizedBox(height: 16),

              // Pest & Disease Card
              _buildFeatureCard(
                context,
                title: 'Pest & Disease',
                subtitle: 'Detect and manage crop pests',
                icon: Icons.bug_report_outlined,
                color: const Color(0xFFE67E22),
                onTap: () {
                  Navigator.pushNamed(context, '/pest-disease');
                },
              ),
              const SizedBox(height: 16),

              // Crop Rotation Card
              _buildFeatureCard(
                context,
                title: 'Crop Rotation',
                subtitle: 'Plan sustainable crop rotation',
                icon: Icons.rotate_right_outlined,
                color: const Color(0xFF1ABC9C),
                onTap: () {
                  Navigator.pushNamed(context, '/crop-rotation');
                },
              ),
              const SizedBox(height: 16),

              // Fertilizer Calculator Card
              _buildFeatureCard(
                context,
                title: 'Fertilizer Calculator',
                subtitle: 'Calculate optimal fertilizer amounts',
                icon: Icons.calculate_outlined,
                color: const Color(0xFF3498DB),
                onTap: () {
                  Navigator.pushNamed(context, '/fertilizer-calculator');
                },
              ),
              const SizedBox(height: 16),

              // Irrigation Scheduler Card
              _buildFeatureCard(
                context,
                title: 'Irrigation Scheduler',
                subtitle: 'Plan and manage irrigation schedules',
                icon: Icons.water_drop_outlined,
                color: const Color(0xFF2ECC71),
                onTap: () {
                  Navigator.pushNamed(context, '/irrigation-scheduler');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Container(
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
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE8F6EF),
              border: Border.all(color: const Color(0xFF2ECC71)),
            ),
            child: const Icon(
              Icons.person_outlined,
              color: Color(0xFF2ECC71),
              size: 30,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Demo User',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Farmer, Agrofirm "Vyborgets"',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF7F8C8D),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildProfileStat('12', 'Fields', Icons.agriculture_outlined),
                    const SizedBox(width: 16),
                    _buildProfileStat('450', 'Ha', Icons.straighten_outlined),
                    const SizedBox(width: 16),
                    _buildProfileStat('3', 'Crops', Icons.eco_outlined),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
              color: const Color(0xFF3498DB),
            ),
            onPressed: () {
              // Navigate to profile settings
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStat(String value, String label, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 14,
          color: const Color(0xFF7F8C8D),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2C3E50),
          ),
        ),
        Text(
          ' $label',
          style: TextStyle(
            fontSize: 10,
            color: const Color(0xFF7F8C8D),
          ),
        ),
      ],
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
}