class  NewsArticle {
  final String title;
  final String description;
  final String url;
  final String imageUrl;  
  final String author;
  final String publishedAt;
  final String content;
  final String sourceName;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,  
    required this.author,
    required this.publishedAt,
    required this.content,
    required this.sourceName,
  });

  
  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      url: json['url'] ?? '',
      imageUrl: json['urlToImage'] ?? '',  
      author: json['author'] ?? 'Unknown Author',
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? 'No Content',
      sourceName: json['source']['name'] ?? 'Unknown Source',
    );
  }
}