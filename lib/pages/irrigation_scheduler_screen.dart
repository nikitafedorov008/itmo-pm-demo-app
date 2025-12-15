import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agromax/l10n/app_localizations.dart' as l10n;

class IrrigationSchedulerScreen extends StatefulWidget {
  const IrrigationSchedulerScreen({super.key});

  @override
  State<IrrigationSchedulerScreen> createState() => _IrrigationSchedulerScreenState();
}

class _IrrigationSchedulerScreenState extends State<IrrigationSchedulerScreen> {
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _cropTypeController = TextEditingController();
  final TextEditingController _soilTypeController = TextEditingController();
  
  String _irrigationMethod = 'Drip';
  String _plantingDate = '';
  double _waterRequirement = 0.0;
  List<Map<String, dynamic>> _schedule = [];

  @override
  void dispose() {
    _areaController.dispose();
    _cropTypeController.dispose();
    _soilTypeController.dispose();
    super.dispose();
  }

  void _calculateIrrigation() {
    double area = double.tryParse(_areaController.text) ?? 0.0;
    if (area > 0) {
      // Simplified calculation - in real app this would be more complex based on crop, soil, and climate
      _waterRequirement = area * 5000; // Simplified formula in liters
      
      // Generate schedule
      _schedule = [
        {'date': 'Day 1', 'amount': '20L', 'duration': '30 min', 'method': 'Drip'},
        {'date': 'Day 3', 'amount': '15L', 'duration': '25 min', 'method': 'Drip'},
        {'date': 'Day 5', 'amount': '25L', 'duration': '35 min', 'method': 'Drip'},
        {'date': 'Day 7', 'amount': '30L', 'duration': '40 min', 'method': 'Drip'},
        {'date': 'Day 10', 'amount': '20L', 'duration': '30 min', 'method': 'Drip'},
      ];
      
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = l10n.AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.transparent, // Make scaffold transparent
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Irrigation Scheduler',
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
              // Scheduler form
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
                      'Plan Your Irrigation Schedule',
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

                    // Crop type input
                    TextField(
                      controller: _cropTypeController,
                      decoration: InputDecoration(
                        labelText: 'Crop Type',
                        hintText: 'Enter crop type',
                        prefixIcon: const Icon(Icons.eco_outlined),
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

                    // Soil type input
                    TextField(
                      controller: _soilTypeController,
                      decoration: InputDecoration(
                        labelText: 'Soil Type',
                        hintText: 'Enter soil type',
                        prefixIcon: const Icon(Icons.terrain_outlined),
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

                    // Irrigation method selection
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE9ECEF)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: _irrigationMethod,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          hintText: 'Select irrigation method',
                        ),
                        items: [
                          'Drip', 'Sprinkler', 'Furrow', 'Flood'
                        ].map((method) => DropdownMenuItem(
                          value: method,
                          child: Text(method),
                        )).toList(),
                        onChanged: (value) {
                          setState(() {
                            _irrigationMethod = value ?? 'Drip';
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Planting date selection
                    ListTile(
                      leading: const Icon(Icons.calendar_today_outlined, color: Color(0xFF3498DB)),
                      title: Text(
                        _plantingDate.isEmpty ? 'Select Planting Date' : 'Planting Date: $_plantingDate',
                        style: TextStyle(
                          color: _plantingDate.isEmpty ? const Color(0xFF7F8C8D) : const Color(0xFF2C3E50),
                          fontSize: 16,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: const Color(0xFF95A5A6),
                      ),
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2026),
                        );
                        if (selectedDate != null) {
                          setState(() {
                            _plantingDate = '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 24),

                    // Calculate button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _calculateIrrigation,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2ECC71),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Generate Schedule',
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
              if (_waterRequirement > 0)
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
                        'Irrigation Requirements',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2C3E50),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildMetricCard(
                              context,
                              title: 'Total Water Needed',
                              value: '${(_waterRequirement / 1000).toStringAsFixed(1)} m³',
                              icon: Icons.water_drop_outlined,
                              color: const Color(0xFF3498DB),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _buildMetricCard(
                              context,
                              title: 'Daily Avg.',
                              value: '25L/ha',
                              icon: Icons.local_drink_outlined,
                              color: const Color(0xFFF1C40F),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              // Schedule section
              if (_schedule.isNotEmpty) ...[
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Irrigation Schedule',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF2C3E50),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Add functionality to save schedule
                            },
                            child: const Text('Save Schedule'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _schedule.length,
                        itemBuilder: (context, index) {
                          final item = _schedule[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8F9FA),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color(0xFFE9ECEF)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF3498DB).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Icon(
                                    Icons.schedule_outlined,
                                    color: const Color(0xFF3498DB),
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['date'],
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF2C3E50),
                                        ),
                                      ),
                                      Text(
                                        '${item['amount']} - ${item['duration']} using ${item['method']} method',
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          color: const Color(0xFF7F8C8D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2ECC71).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Pending',
                                    style: TextStyle(
                                      color: const Color(0xFF2ECC71),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],

              // Tips section
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
                      'Irrigation Tips',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildTipItem(
                      context,
                      'Early Morning Watering',
                      'Water early in the morning to reduce evaporation losses',
                      Icons.wb_sunny_outlined,
                      const Color(0xFF3498DB),
                    ),
                    const SizedBox(height: 8),
                    _buildTipItem(
                      context,
                      'Soil Moisture Monitoring',
                      'Use soil moisture sensors to optimize irrigation timing',
                      Icons.terrain_outlined,
                      const Color(0xFF2ECC71),
                    ),
                    const SizedBox(height: 8),
                    _buildTipItem(
                      context,
                      'Weather Adjustment',
                      'Adjust schedule based on weather conditions and rainfall',
                      Icons.wb_cloudy_outlined,
                      const Color(0xFFF1C40F),
                    ),
                    const SizedBox(height: 8),
                    _buildTipItem(
                      context,
                      'Water Conservation',
                      'Implement water-saving techniques to reduce consumption',
                      Icons.eco_outlined,
                      const Color(0xFF9B59B6),
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
              color: const Color(0xFF2C3E50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipItem(
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