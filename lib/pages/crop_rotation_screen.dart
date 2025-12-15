import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CropRotationScreen extends StatelessWidget {
  const CropRotationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Make scaffold transparent
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Crop Rotation',
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
              // Current season section
              _buildCurrentSeasonCard(context),
              const SizedBox(height: 16),

              // Rotation plan section
              _buildRotationPlanCard(context),
              const SizedBox(height: 16),

              // Crop families section
              _buildCropFamiliesCard(context),
              const SizedBox(height: 16),

              // Benefits of rotation
              _buildBenefitsCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentSeasonCard(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current Season: Spring 2024',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2C3E50),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF2ECC71).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Planting',
                  style: TextStyle(
                    color: const Color(0xFF2ECC71),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Based on your rotation plan, you should plant legumes this season.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: const Color(0xFF7F8C8D),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E8),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF2ECC71),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommended Crops',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildCropChip('Beans', const Color(0xFF2ECC71)),
                    _buildCropChip('Peas', const Color(0xFF2ECC71)),
                    _buildCropChip('Lentils', const Color(0xFF2ECC71)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRotationPlanCard(BuildContext context) {
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
            '4-Year Rotation Plan',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            child: Table(
              border: TableBorder.all(
                color: const Color(0xFFE9ECEF),
                borderRadius: BorderRadius.circular(12),
              ),
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(2),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                  ),
                  children: [
                    _buildTableHeader('Year'),
                    _buildTableHeader('Crop Family'),
                    _buildTableHeader('Benefits'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildTableCell('1'),
                    _buildTableCell('Brassicas\n(Cabbage, Broccoli)'),
                    _buildTableCell('Break pest cycles'),
                  ],
                ),
                TableRow(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                  ),
                  children: [
                    _buildTableCell('2'),
                    _buildTableCell('Legumes\n(Bean, Pea)'),
                    _buildTableCell('Add nitrogen'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildTableCell('3'),
                    _buildTableCell('Grains\n(Wheat, Corn)'),
                    _buildTableCell('Weed control'),
                  ],
                ),
                TableRow(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                  ),
                  children: [
                    _buildTableCell('4'),
                    _buildTableCell('Alliums\n(Onion, Garlic)'),
                    _buildTableCell('Natural pest control'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: const Color(0xFFE9ECEF),
            width: 1,
          ),
          bottom: BorderSide(
            color: const Color(0xFFE9ECEF),
            width: 1,
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF2C3E50),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTableCell(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: const Color(0xFFE9ECEF),
            width: 1,
          ),
          bottom: BorderSide(
            color: const Color(0xFFE9ECEF),
            width: 1,
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF2C3E50),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildCropFamiliesCard(BuildContext context) {
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
            'Crop Families',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildCropFamilyCard('Legumes', 'Beans, Peas, Lentils', Icons.local_florist_outlined, const Color(0xFF2ECC71)),
              _buildCropFamilyCard('Brassicas', 'Cabbage, Broccoli, Kale', Icons.eco_outlined, const Color(0xFF3498DB)),
              _buildCropFamilyCard('Grains', 'Wheat, Corn, Rice', Icons.grain_outlined, const Color(0xFFF1C40F)),
              _buildCropFamilyCard('Alliums', 'Onions, Garlic, Leeks', Icons.water_drop_outlined, const Color(0xFF9B59B6)),
              _buildCropFamilyCard('Solanaceae', 'Tomatoes, Potatoes, Peppers', Icons.local_florist_outlined, const Color(0xFFE74C3C)),
              _buildCropFamilyCard('Cucurbits', 'Cucumbers, Squash, Melons', Icons.eco_outlined, const Color(0xFF1ABC9C)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCropFamilyCard(String title, String crops, IconData icon, Color color) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C3E50),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            crops,
            style: TextStyle(
              fontSize: 10,
              color: const Color(0xFF7F8C8D),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitsCard(BuildContext context) {
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
            'Benefits of Crop Rotation',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          _buildBenefitItem(
            context,
            'Improve Soil Health',
            'Different crops add different nutrients and organic matter',
            Icons.eco_outlined,
            const Color(0xFF2ECC71),
          ),
          const SizedBox(height: 8),
          _buildBenefitItem(
            context,
            'Reduce Pests & Diseases',
            'Breaks pest life cycles and reduces soil-borne diseases',
            Icons.bug_report_outlined,
            const Color(0xFFF1C40F),
          ),
          const SizedBox(height: 8),
          _buildBenefitItem(
            context,
            'Manage Weeds',
            'Disrupts weed growth patterns and reduces herbicide resistance',
            Icons.local_florist_outlined,
            const Color(0xFF3498DB),
          ),
          const SizedBox(height: 8),
          _buildBenefitItem(
            context,
            'Increase Yield',
            'Optimize soil conditions for better crop performance',
            Icons.auto_graph_outlined,
            const Color(0xFF9B59B6),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE9ECEF),
        ),
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

  Widget _buildCropChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}