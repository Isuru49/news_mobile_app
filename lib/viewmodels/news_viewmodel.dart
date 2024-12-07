import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import '../services/news_api_service.dart';

class NewsViewModel extends ChangeNotifier {
  List<NewsArticle> _articles = [];
  final List<NewsArticle> _bookmarkedArticles = []; 
  bool _isLoading = false;
  String? _error;

  List<NewsArticle> get articles => _articles;
  List<NewsArticle> get bookmarkedArticles => _bookmarkedArticles; 
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchTopHeadlines() async {
    _setLoading(true);
    try {
      _articles = await NewsApiService.fetchTopHeadlines();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> fetchSortedArticles(String sortOption) async {
    _setLoading(true);
    try {
      _articles = await NewsApiService.fetchNews(sortedBy: sortOption);
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> searchArticles(String query) async {
    _setLoading(true);
    _error = null;
    try {
      _articles = await NewsApiService.searchArticles(query);
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> fetchArticlesByCategory(String category) async {
    _setLoading(true);
    _error = null;
    try {
      _articles = await NewsApiService.fetchArticlesByCategory(category);
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  void toggleBookmark(NewsArticle article) {
    if (_bookmarkedArticles.contains(article)) {
      _bookmarkedArticles.remove(article);
    } else {
      _bookmarkedArticles.add(article);
    }
    notifyListeners();
  }

  bool isBookmarked(NewsArticle article) {
    return _bookmarkedArticles.contains(article);
  }

  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  
}