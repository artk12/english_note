import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_learning/database/database.dart';
import 'package:word_learning/model/word_counter.dart';
import 'package:word_learning/screens/new_word_screen/new_word_screen.dart';
import 'package:word_learning/screens/quiz_screen/quiz_screen.dart';
import 'package:word_learning/state_managers/providers/refresh_provider.dart';
import 'package:word_learning/widgets/home_page_widget/card_list.dart';

import '../../model/word.dart';
import '../tenses/tenses_screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var refreshProvider = Provider.of<RefreshProvider>(context);

    return Scaffold(
      body: FutureBuilder(
        future: WordDatabase.instance.readAllWord(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          List<Word> words = snapshot.data as List<Word>;

          if(words.isEmpty){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                    border: Border.all(color: Colors.blueGrey,width: 0.5,),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.grey,spreadRadius: 3,blurRadius: 10)
                    ]
                  ),
                  child: Column(
                    children: [
                      Center(child: Text('You dont have a word add something   :)',textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline2!.copyWith(height: 1.5,color: Colors.blueGrey),)),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                        onPressed: () async {
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AddNewWordScreen(),
                              fullscreenDialog: true));
                          refreshProvider.refresh();
                        },
                        child: const Text('Add new word'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          Word lastWord = words.last;
          // DateTime last = DateTime(lastWord.year, lastWord.month, lastWord.day);
          // int diff = DateTime.now().difference(last).inDays;
          return Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
              //   child: Row(
              //     children: [
              //       Text('last word added $diff days ago',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey),)
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddNewWordScreen(),
                            fullscreenDialog: true));
                        refreshProvider.refresh();
                      },
                      child: const Text('new word'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QuizScreen(words: words),
                          ));
                        },
                        child: const Text('take a quiz')),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('statistics')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const TensesScreen(),
                          ));
                        },
                        child: const Text('tense')),
                  ],
                ),
              ),
              Expanded(
                child: WordList(words: words),
              ),
            ],
          );
        },
      ),
    );
  }
}
