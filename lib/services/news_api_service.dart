import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';

class NewsApiService {
  static const String _apiKey = 'b203e0b6b5464cf6ba5a04639b158366';
  static const String _baseUrl = 'https://newsapi.org/v2/top-headlines';

  static Future<List<NewsArticle>> fetchNews({String? sortedBy}) async {
    final String url = _buildUrl(sortedBy);

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> articlesJson = data['articles'];
      return articlesJson
          .map((articleJson) => NewsArticle.fromJson(articleJson))
          .toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  static Future<List<NewsArticle>> fetchTopHeadlines(
      {String country = 'us'}) async {
    final String url = '$_baseUrl?apiKey=$_apiKey&country=$country';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> articlesJson = data['articles'];
      return articlesJson
          .map((articleJson) => NewsArticle.fromJson(articleJson))
          .toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  static Future<List<NewsArticle>> fetchArticlesByCategory(
      String category) async {
    final String url = '$_baseUrl?apiKey=$_apiKey&category=$category';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> articlesJson = data['articles'];
      return articlesJson
          .map((articleJson) => NewsArticle.fromJson(articleJson))
          .toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  static Future<List<NewsArticle>> searchArticles(String query) async {
    final String url =
        'https://newsapi.org/v2/everything?apiKey=$_apiKey&q=$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> articlesJson = data['articles'];
      return articlesJson
          .map((articleJson) => NewsArticle.fromJson(articleJson))
          .toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  static String _buildUrl(String? sortedBy) {
    String sortByQuery = '';
    if (sortedBy != null) {
      switch (sortedBy) {
        case 'Latest':
          sortByQuery = 'publishedAt';
          break;
        case 'Popular':
          sortByQuery = 'relevancy';
          break;
        case 'Source':
          sortByQuery = 'source.name';
          break;
        default:
          sortByQuery = 'publishedAt';
      }
    }
    return '$_baseUrl?apiKey=$_apiKey&sortBy=$sortByQuery';
  }
}