import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Make scaffold transparent
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Notifications',
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
              // Notifications filter tabs
              _buildFilterTabs(),
              const SizedBox(height: 16),

              // Notifications list
              _buildNotificationsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedFilter = 'All';
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedFilter == 'All' ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Center(
                    child: Text(
                      'All',
                      style: GoogleFonts.montserrat(
                        fontWeight: _selectedFilter == 'All' ? FontWeight.w600 : FontWeight.w500,
                        color: _selectedFilter == 'All' ? const Color(0xFF2ECC71) : const Color(0xFF7F8C8D),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedFilter = 'Field';
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedFilter == 'Field' ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Center(
                    child: Text(
                      'Field',
                      style: GoogleFonts.montserrat(
                        fontWeight: _selectedFilter == 'Field' ? FontWeight.w600 : FontWeight.w500,
                        color: _selectedFilter == 'Field' ? const Color(0xFF2ECC71) : const Color(0xFF7F8C8D),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedFilter = 'Weather';
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedFilter == 'Weather' ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Center(
                    child: Text(
                      'Weather',
                      style: GoogleFonts.montserrat(
                        fontWeight: _selectedFilter == 'Weather' ? FontWeight.w600 : FontWeight.w500,
                        color: _selectedFilter == 'Weather' ? const Color(0xFF2ECC71) : const Color(0xFF7F8C8D),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationsList() {
    List<Map<String, dynamic>> allNotifications = [
      {
        'title': 'Field #3 - Nitrogen Deficiency',
        'subtitle': 'Soil analysis shows low nitrogen levels in the eastern section',
        'time': '10 min ago',
        'icon': Icons.grass_outlined,
        'color': const Color(0xFF2ECC71),
        'isImportant': true,
        'category': 'Field'
      },
      {
        'title': 'Weather Alert: Heavy Rain',
        'subtitle': 'Expected tomorrow morning. Consider covering sensitive crops',
        'time': '30 min ago',
        'icon': Icons.water_drop_outlined,
        'color': const Color(0xFF3498DB),
        'isImportant': true,
        'category': 'Weather'
      },
      {
        'title': 'Pest Alert: Aphids Detected',
        'subtitle': 'Pest monitoring system detected aphid activity in greenhouse #2',
        'time': '1 hour ago',
        'icon': Icons.bug_report_outlined,
        'color': const Color(0xFFE74C3C),
        'isImportant': false,
        'category': 'Field'
      },
      {
        'title': 'Irrigation Reminder',
        'subtitle': 'Scheduled irrigation for Field A is due in 2 hours',
        'time': '2 hours ago',
        'icon': Icons.water_outlined,
        'color': const Color(0xFFF1C40F),
        'isImportant': false,
        'category': 'Field'
      },
      {
        'title': 'Harvest Update',
        'subtitle': 'Wheat harvest in Field B is 85% complete',
        'time': '3 hours ago',
        'icon': Icons.check_circle_outline,
        'color': const Color(0xFF2ECC71),
        'isImportant': false,
        'category': 'Field'
      },
      {
        'title': 'Equipment Maintenance',
        'subtitle': 'Tractor #5 requires maintenance service',
        'time': '1 day ago',
        'icon': Icons.construction_outlined,
        'color': const Color(0xFF9B59B6),
        'isImportant': true,
        'category': 'Field'
      },
      {
        'title': 'Temperature Drop Warning',
        'subtitle': 'Freeze warning overnight. Take protective measures for sensitive crops',
        'time': '5 hours ago',
        'icon': Icons.thermostat_outlined,
        'color': const Color(0xFF3498DB),
        'isImportant': true,
        'category': 'Weather'
      },
      {
        'title': 'Humidity Alert',
        'subtitle': 'High humidity levels detected. Monitor for fungal diseases',
        'time': '7 hours ago',
        'icon': Icons.water_drop_outlined,
        'color': const Color(0xFF3498DB),
        'isImportant': false,
        'category': 'Weather'
      },
    ];

    // Filter notifications based on selected category
    List<Map<String, dynamic>> filteredNotifications = allNotifications;
    if (_selectedFilter != 'All') {
      filteredNotifications = allNotifications
          .where((notification) => notification['category'] == _selectedFilter)
          .toList();
    }

    if (filteredNotifications.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(
              Icons.notifications_none_outlined,
              size: 60,
              color: const Color(0xFFBDC3C7),
            ),
            const SizedBox(height: 16),
            Text(
              'No notifications',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2C3E50),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'No notifications found in this category',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: const Color(0xFF7F8C8D),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        for (int i = 0; i < filteredNotifications.length; i++)
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: _buildNotificationItem(
              title: filteredNotifications[i]['title'],
              subtitle: filteredNotifications[i]['subtitle'],
              time: filteredNotifications[i]['time'],
              icon: filteredNotifications[i]['icon'],
              color: filteredNotifications[i]['color'],
              isImportant: filteredNotifications[i]['isImportant'],
            ),
          ),
      ],
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String subtitle,
    required String time,
    required IconData icon,
    required Color color,
    required bool isImportant,
  }) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
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
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2C3E50),
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF95A5A6),
                      ),
                    ),
                  ],
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
          if (isImportant)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF2CC),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFFFB26B)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.priority_high_outlined,
                    color: const Color(0xFFFF8C00),
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Urgent',
                    style: TextStyle(
                      color: const Color(0xFFFF8C00),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
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