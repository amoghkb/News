import 'package:flutter/material.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize TabController with 3 tabs (Politics, Sports, Business)
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();  // Dispose the TabController when no longer needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TabBar that is now controlled by the TabController
        TabBar(
          controller: _tabController,
          labelStyle: const TextStyle(
              fontFamily: "Poppins-SemiBold",
              color: Colors.black,
              fontSize: 15),
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.brown,
          indicatorColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: const [
            Tab(text: "Politics"),
            Tab(text: "Sports"),
            Tab(text: "Business"),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              Center(child: Text("Politics News Content")),
              Center(child: Text("Sports News Content")),
              Center(child: Text("Business News Content")),
            ],
          ),
        ),
      ],
    );
  }
}
