import 'package:flutter/foundation.dart';
import '../models/category_model.dart';

class CategoryViewModel extends ChangeNotifier {
  final List<NewsCategory> _categories = [
    NewsCategory(
      id: 'general',
      name: 'General',
      description: 'General news and updates from around the world.',
      imageUrl: 'https://example.com/general.jpg',
    ),
    NewsCategory(
      id: 'technology',
      name: 'Technology',
      description: 'Latest updates in technology and gadgets.',
      imageUrl: 'https://example.com/technology.jpg',
    ),
    NewsCategory(
      id: 'sports',
      name: 'Sports',
      description: 'Breaking sports news and updates.',
      imageUrl: 'https://example.com/sports.jpg',
    ),
    NewsCategory(
      id: 'business',
      name: 'Business',
      description: 'News about businesses, markets, and finance.',
      imageUrl: 'https://example.com/business.jpg',
    ),
    NewsCategory(
      id: 'health',
      name: 'Health',
      description: 'Updates on health and wellness.',
      imageUrl: 'https://example.com/health.jpg',
    ),
    NewsCategory(
      id: 'entertainment',
      name: 'Entertainment',
      description: 'Latest news in movies, music, and celebrities.',
      imageUrl: 'https://example.com/entertainment.jpg',
    ),
    NewsCategory(
      id: 'science',
      name: 'Science',
      description: 'Discoveries and news in science and research.',
      imageUrl: 'https://example.com/science.jpg',
    ),
  ];

  List<NewsCategory> get categories => _categories;

  void addCategory(NewsCategory category) {
    _categories.add(category);
    notifyListeners();
  }

  void removeCategory(String id) {
    _categories.removeWhere((category) => category.id == id);
    notifyListeners();
  }
}