import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/news_viewmodel.dart';
import 'components/news_card.dart';


class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<NewsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarked Articles'),      
        backgroundColor: const Color.fromARGB(255, 104, 151, 220),
      ),
      body: newsViewModel.bookmarkedArticles.isEmpty
          ? const Center(
              child: Text(
                'No bookmarks yet.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: newsViewModel.bookmarkedArticles.length,
              itemBuilder: (context, index) {
                final article = newsViewModel.bookmarkedArticles[index];
                return NewsCard(
                  article: article,
                  isBookmarked: true, 
                  onBookmarkToggle: () {
                    newsViewModel.toggleBookmark(article);
                  },
                );
              },
            ),
    );
  }
}