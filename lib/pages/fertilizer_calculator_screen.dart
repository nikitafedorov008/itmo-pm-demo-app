import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FertilizerCalculatorScreen extends StatefulWidget {
  const FertilizerCalculatorScreen({super.key});

  @override
  State<FertilizerCalculatorScreen> createState() => _FertilizerCalculatorScreenState();
}

class _FertilizerCalculatorScreenState extends State<FertilizerCalculatorScreen> {
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _nitrogenController = TextEditingController();
  final TextEditingController _phosphorusController = TextEditingController();
  final TextEditingController _potassiumController = TextEditingController();
  String _cropType = 'Wheat';
  String _fertilizerType = 'NPK 10-10-10';
  
  double _calculatedAmount = 0.0;
  String _unit = 'kg';

  @override
  void dispose() {
    _areaController.dispose();
    _nitrogenController.dispose();
    _phosphorusController.dispose();
    _potassiumController.dispose();
    super.dispose();
  }

  void _calculateFertilizer() {
    double area = double.tryParse(_areaController.text) ?? 0.0;
    double nitrogen = double.tryParse(_nitrogenController.text) ?? 0.0;
    double phosphorus = double.tryParse(_phosphorusController.text) ?? 0.0;
    double potassium = double.tryParse(_potassiumController.text) ?? 0.0;

    if (area > 0) {
      // Simplified calculation - in real app this would be more complex based on crop requirements
      double totalNPK = (nitrogen + phosphorus + potassium) / 100;
      _calculatedAmount = area * totalNPK * 100; // Simplified formula
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Make scaffold transparent
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Fertilizer Calculator',
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
              // Calculator form
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
                      'Calculate Fertilizer Requirements',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Field area input
                    TextField(
                      controller: _areaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Field Area (hectares)',
                        hintText: 'Enter field area',
                        prefixIcon: const Icon(Icons.area_chart),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFFE9ECEF)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFFE9ECEF)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: const Color(0xFF2ECC71), width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Crop type selection
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE9ECEF)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: _cropType,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          hintText: 'Select crop type',
                        ),
                        items: [
                          'Wheat', 'Corn', 'Rice', 'Tomato', 'Potato', 'Soybean'
                        ].map((crop) => DropdownMenuItem(
                          value: crop,
                          child: Text(crop),
                        )).toList(),
                        onChanged: (value) {
                          setState(() {
                            _cropType = value ?? 'Wheat';
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Fertilizer type selection
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE9ECEF)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: _fertilizerType,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          hintText: 'Select fertilizer type',
                        ),
                        items: [
                          'NPK 10-10-10', 'NPK 16-16-16', 'NPK 20-20-20', 'Urea 46-0-0', 
                          'DAP 18-46-0', 'MOP 0-0-60'
                        ].map((fert) => DropdownMenuItem(
                          value: fert,
                          child: Text(fert),
                        )).toList(),
                        onChanged: (value) {
                          setState(() {
                            _fertilizerType = value ?? 'NPK 10-10-10';
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Nutrient requirements
                    Text(
                      'Nutrient Requirements (kg/hectare)',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _nitrogenController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'N',
                              prefixIcon: Icon(Icons.nature),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _phosphorusController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'P',
                              prefixIcon: Icon(Icons.local_florist_outlined),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _potassiumController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'K',
                              prefixIcon: Icon(Icons.water_drop_outlined),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Calculate button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _calculateFertilizer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2ECC71),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Calculate',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Results section
              if (_calculatedAmount > 0)
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
                        'Calculation Results',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2C3E50),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Recommended Fertilizer Amount:',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2C3E50),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${_calculatedAmount.toStringAsFixed(2)} $_unit',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF2ECC71),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'For $_cropType on ${_areaController.text} hectares using $_fertilizerType',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF7F8C8D),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

              // Fertilizer recommendations
              const SizedBox(height: 16),
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
                      'Fertilizer Recommendations',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildRecommendationItem(
                      'Apply during planting',
                      'Apply 70% of nitrogen at planting',
                      Icons.info_outlined,
                      const Color(0xFFF1C40F),
                    ),
                    const SizedBox(height: 8),
                    _buildRecommendationItem(
                      'Top-dress application',
                      'Apply remaining 30% during growing season',
                      Icons.notifications_outlined,
                      const Color(0xFF3498DB),
                    ),
                    const SizedBox(height: 8),
                    _buildRecommendationItem(
                      'Soil pH consideration',
                      'Maintain pH between 6.0-7.0 for optimal nutrient uptake',
                      Icons.terrain_outlined,
                      const Color(0xFF2ECC71),
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