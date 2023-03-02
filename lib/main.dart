import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_learning/database/database.dart';
import 'package:word_learning/load_assets/load_assets.dart';
import 'package:word_learning/model/quiz.dart';
import 'package:word_learning/model/word_counter.dart';
import 'package:word_learning/screens/home_page_screen/home_page_screen.dart';
import 'package:word_learning/screens/search_screen/search_screen.dart';
import 'package:word_learning/state_managers/providers/refresh_provider.dart';
import 'package:word_learning/theme.dart';

import 'model/tense.dart';
import 'model/word.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: RefreshProvider()),
        FutureProvider<List<Tense>>(create: (context)=> LoadFromAssets.getTenses(),initialData: const [],),
        FutureProvider<List<WordCounter>>(create: (context)=> WordDatabase.instance.readAllWordCounter(),initialData: const [],),
        FutureProvider<List<Word>>(create: (context)=> WordDatabase.instance.readAllWord(),initialData: const [],),
        FutureProvider<List<Quiz>>(create: (context)=> WordDatabase.instance.readAllQuizzes(),initialData: const [],),
      ],
      child: MaterialApp(
        title: 'Word Learning',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.instance.lightTheme,
        home: const MyHomePage(title: 'word learning'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FutureProvider.value(
                    value: WordDatabase.instance.readAllWord(),
                    initialData: null,
                    child: const SearchScreen(),
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: const HomePageScreen(),
    );
  }
}
