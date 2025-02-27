import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/APIModel.dart';
import 'package:http/http.dart' as http;

import 'Inside_news.dart';

class MainNewscard extends StatefulWidget {
  final String country;
  const MainNewscard({super.key, required this.country});

  @override
  State<MainNewscard> createState() => _MainNewscardState();
}

class _MainNewscardState extends State<MainNewscard> {



  final String API_key = "ff43a5bdd07946a3950377e54f9e0bbc";
  List<ApiModel> CountryData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    CountryGetDetails(widget.country); // Fetch default country news
  }

  @override
  void didUpdateWidget(MainNewscard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.country != widget.country) {
      setState(() {
        isLoading = true;
      });
      CountryGetDetails(widget.country); // Fetch news when country changes
    }
  }

  Future<void> CountryGetDetails(String country) async {
    final String Url =
        "https://newsapi.org/v2/everything?q=$country&from=2025-01-20&sortBy=publishedAt&apiKey=$API_key";

    try {
      final res = await http.get(Uri.parse(Url));
      if (res.statusCode == 200) {
        List<dynamic> data = jsonDecode(res.body)["articles"];

        setState(() {
          CountryData = data.map((e) => ApiModel.fromMap(e)).toList();
          isLoading = false;
        });
      } else {
        throw Exception("Error occurred");
      }
    } catch (e) {
      print("Error Occurred: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
      child: CupertinoActivityIndicator(color: Colors.brown),
    )
        : ListView.builder(
      itemCount: CountryData.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // Navigate to InsideNews with the selected news details
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InsideNews(news: CountryData[index]),
              ),
            );
          },
          child: Card(
            color: Colors.white,
            elevation: 11,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: 250,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Background Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      CountryData[index].urlToImage ??
                          "https://via.placeholder.com/150", // Fallback image
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          "https://via.placeholder.com/150",
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),

                  // Gradient Overlay for better text readability
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  // News Title
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Text(
                      CountryData[index].title ?? "No Title Available",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
