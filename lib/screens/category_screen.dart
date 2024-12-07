import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/category_viewmodel.dart';
import '../viewmodels/news_viewmodel.dart';
import '../screens/home_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryViewModel = Provider.of<CategoryViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('News Categories')),
      body: ListView.builder(
        itemCount: categoryViewModel.categories.length,
        itemBuilder: (context, index) {
          final category = categoryViewModel.categories[index];
          return ListTile(
            leading: Image.network(
              category.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(category.name),
            subtitle: Text(category.description),
            onTap: () {
              final newsViewModel =
                  Provider.of<NewsViewModel>(context, listen: false);
              newsViewModel.fetchArticlesByCategory(category.id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}