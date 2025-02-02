import 'package:flutter/material.dart';
import 'package:news/TreandingFolder/Filters/Business.dart';
import 'package:news/TreandingFolder/Filters/Politics.dart';
import 'package:news/TreandingFolder/Filters/Sports.dart';
import '../TreandingFolder/Treanding_Page.dart';
import 'Country.dart';
import 'Main_NewsCard.dart';

class HomescreenMain extends StatefulWidget {
  const HomescreenMain({super.key});

  @override
  State<HomescreenMain> createState() => _HomescreenMainState();
}

class _HomescreenMainState extends State<HomescreenMain> {
  int _selectedIndex = 0; // Track selected tab
  String selectedCountry = "India"; // Default selected country

  // Pages getter method
  List<Widget> get _pages => [
    _homeScreen(),
    const TrendingScreen(),
  ];

  // Home Screen UI
  Widget _homeScreen() {
    return Column(
      children: [
        Country(
          selectedCountry: selectedCountry,
          onCountrySelect: (String country) {
            setState(() {
              selectedCountry = country;
            });
          },
        ),
        Expanded(
          child: MainNewscard(country: selectedCountry),
        ),
      ],
    );
  }

  // Handle Bottom Navigation Tab Change
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Required for TabBar
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: _selectedIndex == 0
            ? AppBar(
          backgroundColor: Colors.white,
          title: const Text("News"),
        )
            : AppBar(
          backgroundColor: Colors.white,
          title: const Text("Trending"),
          bottom: const TabBar(
            labelStyle: TextStyle(
                fontFamily: "Poppins-SemiBold",
                color: Colors.black,
                fontSize: 15),
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.brown,
            indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: "Politics"),
              Tab(text: "Sports"),
              Tab(text: "Business"),
            ],
          ),
        ),

        body: _selectedIndex == 0
            ? _homeScreen()
            : const TabBarView(
          children: [
            Politics(),
            Sports(),
            Business()
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black87,
          type: BottomNavigationBarType.shifting,
          showUnselectedLabels: true,
          selectedLabelStyle:
          const TextStyle(backgroundColor: Colors.transparent),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: "Trending",
            ),
          ],
        ),
      ),
    );
  }
}
