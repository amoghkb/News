import 'package:flutter/material.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TabBar will be managed in HomescreenMain
        const TabBar(
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
        Expanded(
          child: const TabBarView(
            children: [
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
