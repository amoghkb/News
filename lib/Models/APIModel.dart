class ApiModel {
  String name;
  String author;
  String title;
  String description;
  String url;
  String content;
  String urlToImage;

  ApiModel({
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.content,
    required this.urlToImage,
  });

  // Convert object to a map (for debugging or local storage)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'content': content,
      'urlToImage': urlToImage,
    };
  }

  // Factory constructor to create an ApiModel instance from JSON
  factory ApiModel.fromMap(Map<String, dynamic> map) {
    return ApiModel(
      name: map['source'] != null ? map['source']['name'] ?? 'Unknown' : 'Unknown',
      author: map['author'] ?? 'Unknown Author',
      title: map['title'] ?? 'No Title',
      description: map['description'] ?? 'No Description',
      url: map['url'] ?? 'No Image',
      content: map['content'] ?? 'No Content',
      urlToImage: map['urlToImage'] ?? 'No Image', // Default image if null
    );
  }
}
