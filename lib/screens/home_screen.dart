import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/news_viewmodel.dart';
import 'search_screen.dart';
import 'category_screen.dart';
import 'bookmark_screen.dart';
import 'components/news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<NewsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: const Color.fromARGB(255, 13, 71, 161),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.newspaper, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'News Today',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 26),
            tooltip: 'Search',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.category, size: 26),
            tooltip: 'Categories',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryScreen()),
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String sortOption) {
              setState(() {});
              newsViewModel.fetchSortedArticles(sortOption);
            },
            itemBuilder: (BuildContext context) {
              return ['Latest', 'Popular', 'Source']
                  .map((sortOption) => PopupMenuItem<String>(
                        value: sortOption,
                        child: Text(sortOption),
                      ))
                  .toList();
            },
            icon: const Icon(Icons.sort, size: 26),
            tooltip: 'Sort',
          ),
          IconButton(
            icon: const Icon(Icons.bookmark, size: 26),
            tooltip: 'Bookmarks',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookmarkScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: newsViewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : newsViewModel.error != null
                ? Center(
                    child: Text(
                      newsViewModel.error!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView.builder(
                      itemCount: newsViewModel.articles.length,
                      itemBuilder: (context, index) {
                        final article = newsViewModel.articles[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          elevation: 5,
                          shadowColor: Colors.blue.shade200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: NewsCard(
                            article: article,
                            isBookmarked: newsViewModel.bookmarkedArticles
                                .contains(article),
                            onBookmarkToggle: () {
                              newsViewModel.toggleBookmark(article);
                            },
                          ),
                        );
                      },
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => newsViewModel.fetchTopHeadlines(),
        backgroundColor: Colors.blue.shade900,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}