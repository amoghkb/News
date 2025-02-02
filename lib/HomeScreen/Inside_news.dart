import 'package:flutter/material.dart';
import '../Models/APIModel.dart';

class InsideNews extends StatelessWidget {
  final ApiModel news;
  const InsideNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Details"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // News Image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  news.urlToImage,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      "https://via.placeholder.com/150",
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),

            // News Title
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                news.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            // News Author
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Author: ${news.author}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 10),

            // News Description
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
               "${news.description}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 10),


          ],
        ),
      ),
    );
  }
}
