import 'package:flutter/material.dart';
import '../../models/news_model.dart';
import '../article_details_screen.dart';

class NewsCard extends StatelessWidget {
  final NewsArticle article;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;

  const NewsCard({
    required this.article,
    required this.isBookmarked,
    required this.onBookmarkToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: InkWell(
        onTap: () { 
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailsScreen(article: article),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [           
              article.imageUrl.isNotEmpty
                  ? Image.network(article.imageUrl)
                  : const SizedBox.shrink(),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      article.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: isBookmarked ? Colors.red : Colors.grey,
                    ),
                    onPressed: onBookmarkToggle, 
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                article.sourceName,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              Text(
                article.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}