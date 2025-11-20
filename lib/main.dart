import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AgroMaxApp());
}

class AgroMaxApp extends StatelessWidget {
  const AgroMaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroMax Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        textTheme: GoogleFonts.montserratTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF2ECC71),
          unselectedItemColor: Color(0xFF95A5A6),
        ),
      ),
      home: const MainDashboardScreen(),
      routes: {
        '/weather': (context) => const WeatherScreen(),
        '/plant-health': (context) => const PlantHealthScreen(),
        '/field-details': (context) => const FieldDetailsScreen(),
        '/subscription': (context) => const SubscriptionScreen(),
        '/growth': (context) => const GrowthScreen(),
        '/experiments': (context) => const ExperimentsScreen(),
        '/retrospective': (context) => const RetrospectiveScreen(),
        '/create-room': (context) => const CreateRoomScreen(),
        '/weekly-insights': (context) => const WeeklyInsightsScreen(),
        '/product': (context) => const ProductScreen(),
        '/strategy': (context) => const StrategyScreen(),
      },
    );
  }
}

class MainDashboardScreen extends StatefulWidget {
  const MainDashboardScreen({super.key});

  @override
  State<MainDashboardScreen> createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen> {
  int _currentIndex = 0;
  String _currentScreen = 'Home';

  final List<String> _menuItems = [
    'Details Field',
    'Subscription',
    'Growth',
    'Experiments',
    'Sprint Retrospective',
    'Create a Room',
    'Weekly Insights',
    'Product',
    'Strategy 2025'
  ];

  final List<IconData> _menuIcons = [
    Icons.map_outlined,
    Icons.payment_outlined,
    Icons.auto_graph_outlined,
    Icons.science_outlined,
    Icons.view_comfy_outlined,
    Icons.group_outlined,
    Icons.analytics_outlined,
    Icons.shopping_cart_outlined,
    Icons.trending_up_outlined,
  ];

  final List<String> _routes = [
    '/field-details',
    '/subscription',
    '/growth',
    '/experiments',
    '/retrospective',
    '/create-room',
    '/weekly-insights',
    '/product',
    '/strategy',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgroMax'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: _buildMainContent(context),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      width: 280,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Header with avatar and name
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: const Color(0xFF3498DB),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Color(0xFF3498DB),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Alexander',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'alexander@gmail.com',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Menu items
            Expanded(
              child: ListView.builder(
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  return _buildMenuItem(
                    context: context, // Исправлено: context как именованный параметр
                    title: _menuItems[index],
                    icon: _menuIcons[index],
                    isActive: _currentScreen == _menuItems[index],
                    onTap: () {
                      setState(() {
                        _currentScreen = _menuItems[index];
                      });
                      Navigator.pop(context);
                      Navigator.pushNamed(context, _routes[index]);
                    },
                  );
                },
              ),
            ),
            // Logout button at bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFE9ECEF),
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        color: const Color(0xFFE74C3C),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Logout',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFFE74C3C),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required String title,
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFE3F2FD) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? const Color(0xFF3498DB) : const Color(0xFFE9ECEF),
            width: isActive ? 1 : 0.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFF3498DB).withOpacity(0.1)
                    : const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: isActive ? const Color(0xFF3498DB) : const Color(0xFF7F8C8D),
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isActive ? const Color(0xFF2C3E50) : const Color(0xFF7F8C8D),
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            const Spacer(),
            if (isActive)
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: const Color(0xFF3498DB),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upcoming meetings section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'No upcoming meetings',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF2C3E50),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xFF3498DB),
                      ),
                      onPressed: () {},
                    ),
                  ],
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
                            width: 4,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3498DB),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Team Meeting',
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
                                'Today, 10:00 AM',
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
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE3F2FD),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Online',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                color: const Color(0xFF3498DB),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Quick access section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Quick Access',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: const Color(0xFF2C3E50),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 120,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              children: [
                _buildQuickAccessCard(
                  context,
                  icon: Icons.eco_outlined,
                  title: 'Details Field',
                  color: const Color(0xFF3498DB),
                  onTap: () => Navigator.pushNamed(context, '/field-details'),
                ),
                _buildQuickAccessCard(
                  context,
                  icon: Icons.auto_graph_outlined,
                  title: 'Growth',
                  color: const Color(0xFF2ECC71),
                  onTap: () => Navigator.pushNamed(context, '/growth'),
                ),
                _buildQuickAccessCard(
                  context,
                  icon: Icons.science_outlined,
                  title: 'Experiments',
                  color: const Color(0xFF9B59B6),
                  onTap: () => Navigator.pushNamed(context, '/experiments'),
                ),
                _buildQuickAccessCard(
                  context,
                  icon: Icons.analytics_outlined,
                  title: 'Weekly Insights',
                  color: const Color(0xFFF39C12),
                  onTap: () =>
                      Navigator.pushNamed(context, '/weekly-insights'),
                ),
                _buildQuickAccessCard(
                  context,
                  icon: Icons.group_outlined,
                  title: 'Create a Room',
                  color: const Color(0xFFE74C3C),
                  onTap: () => Navigator.pushNamed(context, '/create-room'),
                ),
              ],
            ),
          ),

          // Recent activities section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Activities',
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
                                'Field Report Updated',
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
                                'Updated NDVI analysis for Field #3',
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
                            '2h ago',
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
                                'Weather Alert',
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
                                'Heavy rain expected tomorrow',
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
                            '5h ago',
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
          ),
        ],
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
              color: Colors.black.withOpacity(0.05),
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
                color: color.withOpacity(0.1),
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
}

// Остальные экраны остаются без изменений
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const SizedBox(height: 20),
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
          ],
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
}

class PlantHealthScreen extends StatelessWidget {
  const PlantHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basil Plant'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
            ],
          ),
        ),
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

// Placeholder screens for other routes
class FieldDetailsScreen extends StatelessWidget {
  const FieldDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(context, 'Details Field', Icons.map_outlined);
  }
}

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(context, 'Subscription', Icons.payment_outlined);
  }
}

class GrowthScreen extends StatelessWidget {
  const GrowthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(context, 'Growth', Icons.auto_graph_outlined);
  }
}

class ExperimentsScreen extends StatelessWidget {
  const ExperimentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(context, 'Experiments', Icons.science_outlined);
  }
}

class RetrospectiveScreen extends StatelessWidget {
  const RetrospectiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(context, 'Sprint Retrospective', Icons.view_comfy_outlined);
  }
}

class CreateRoomScreen extends StatelessWidget {
  const CreateRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(context, 'Create a Room', Icons.group_outlined);
  }
}

class WeeklyInsightsScreen extends StatelessWidget {
  const WeeklyInsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(context, 'Weekly Insights', Icons.analytics_outlined);
  }
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(context, 'Product', Icons.shopping_cart_outlined);
  }
}

class StrategyScreen extends StatelessWidget {
  const StrategyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(context, 'Strategy 2025', Icons.trending_up_outlined);
  }
}

Widget _buildPlaceholderScreen(BuildContext context, String title, IconData icon) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF3498DB).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              size: 40,
              color: const Color(0xFF3498DB),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '$title Screen',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'This is a demo screen without real functionality',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF7F8C8D),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3498DB),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Back to Home',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}