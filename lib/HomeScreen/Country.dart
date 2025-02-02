import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final String selectedCountry;
  final Function(String) onCountrySelect;

  const Country({
    super.key,
    required this.selectedCountry,
    required this.onCountrySelect,
  });

  @override
  Widget build(BuildContext context) {
    List<String> countryList = [
      "India", "Russia", "USA", "Afghanistan", "Argentina",
      "Australia", "Bangladesh", "Brazil", "Canada","China", "Germany",
      "Iraq", "Iran", "Israel", "Maldives", "NewZealand",
      "Pakistan", "SriLanka", "Ukraine"
    ];

    return Column(
      children: [
        SizedBox(
          height: 50, // Increased height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: countryList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onCountrySelect(countryList[index]); // Pass selected country back
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0), // Adds spacing
                  child: Card(
                    elevation: 7,
                    color: selectedCountry == countryList[index]
                        ? Colors.blue // Highlight selected country
                        : Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: SizedBox(
                      width: 150, // Set card width
                      child: Center(
                        child: Text(
                          countryList[index],
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
