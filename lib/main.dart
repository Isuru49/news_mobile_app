import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/news_viewmodel.dart';
import 'viewmodels/category_viewmodel.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/category_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/search': (context) =>const SearchScreen(),
        '/category': (context) => const CategoryScreen(),
      },
    );
  }
}