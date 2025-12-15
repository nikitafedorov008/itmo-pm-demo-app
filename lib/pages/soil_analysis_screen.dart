import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SoilAnalysisScreen extends StatelessWidget {
  const SoilAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Make scaffold transparent
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Soil Analysis',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Soil composition section
              _buildSoilCompositionCard(context),
              const SizedBox(height: 16),

              // pH level section
              _buildPHLevelCard(context),
              const SizedBox(height: 16),

              // Nutrient levels section
              _buildNutrientLevelsCard(context),
              const SizedBox(height: 16),

              // Soil texture section
              _buildSoilTextureCard(context),
              const SizedBox(height: 16),

              // Recommendations section
              _buildRecommendationsCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSoilCompositionCard(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Soil Composition',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildCompositionItem('Sand', 40, const Color(0xFFD2B48C)),
              const SizedBox(width: 16),
              _buildCompositionItem('Silt', 45, const Color(0xFFA0522D)),
              const SizedBox(width: 16),
              _buildCompositionItem('Clay', 15, const Color(0xFF8B4513)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompositionItem(String label, int percentage, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              '$percentage%',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: const Color(0xFF7F8C8D),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPHLevelCard(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'pH Level',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '6.2',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2ECC71),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Slightly acidic - Good for most crops',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF7F8C8D),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFE74C3C), // Red for acidic
                        Color(0xFFF1C40F), // Yellow for neutral
                        Color(0xFF2ECC71), // Green for alkaline
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Row(
                    children: [
                      // pH indicator position
                      Container(
                        width: 150 * 6.2 / 14, // Position based on pH value
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                          size: 24,
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
    );
  }

  Widget _buildNutrientLevelsCard(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nutrient Levels',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          _buildNutrientItem('Nitrogen', 75, const Color(0xFF2ECC71), 'Good'),
          const SizedBox(height: 8),
          _buildNutrientItem('Phosphorus', 45, const Color(0xFFF1C40F), 'Low'),
          const SizedBox(height: 8),
          _buildNutrientItem('Potassium', 85, const Color(0xFF2ECC71), 'High'),
          const SizedBox(height: 8),
          _buildNutrientItem('Organic Matter', 35, const Color(0xFF2ECC71), 'Good'),
        ],
      ),
    );
  }

  Widget _buildNutrientItem(String name, int level, Color color, String status) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFF2C3E50),
              ),
            ),
            Text(
              '$level% - $status',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: status == 'Low' ? const Color(0xFFE74C3C) : color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: level / 100,
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
          backgroundColor: Colors.grey.shade200,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ],
    );
  }

  Widget _buildSoilTextureCard(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Soil Texture',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Loamy Sand - Best texture for most crops. Good balance of drainage and water retention.',
              style: TextStyle(
                color: Color(0xFF7F8C8D),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationsCard(BuildContext context) {
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
            context,
            'Add organic compost to increase phosphorus levels',
            Icons.local_florist_outlined,
            const Color(0xFFF1C40F),
          ),
          const SizedBox(height: 8),
          _buildRecommendationItem(
            context,
            'Consider liming to adjust pH to 6.5-7.0',
            Icons.water_drop_outlined,
            const Color(0xFF3498DB),
          ),
          const SizedBox(height: 8),
          _buildRecommendationItem(
            context,
            'Plan nitrogen application before planting',
            Icons.grain_outlined,
            const Color(0xFF2ECC71),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationItem(
      BuildContext context, String text, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: const Color(0xFF2C3E50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}