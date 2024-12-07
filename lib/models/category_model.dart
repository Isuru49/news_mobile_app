class NewsCategory {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  NewsCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory NewsCategory.fromJson(Map<String, dynamic> json) {
    return NewsCategory(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Unnamed Category',
      description: json['description'] ?? 'No Description',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}