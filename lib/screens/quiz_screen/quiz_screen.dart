import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_learning/database/database.dart';
import 'package:word_learning/model/question.dart';
import 'package:word_learning/screens/challenge/challenge.dart';
import 'package:word_learning/state_managers/providers/quiz_manager.dart';

import '../../model/word.dart';
import '../../model/word_counter.dart';

class QuizScreen extends StatelessWidget {
  final List<Word> words;
  const QuizScreen({Key? key, required this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'challenging',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: FutureBuilder<Object>(
          future: WordDatabase.instance.readAllWordCounter(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<WordCounter> wordsCounter =
                  snapshot.data as List<WordCounter>;
              wordsCounter.sort((a, b) => a.repeat!.compareTo(b.repeat!));
              List<WordCounter> chosen = wordsCounter.getRange(0, 10).toList();
              List<Word> wordQuestions = [];
              List<Question> questions = [];
              for (var element in chosen) {
                wordQuestions.add(words[element.idWord!]);
              }
              Random random = Random();

              for (Word element in wordQuestions) {
                List<Word> randomWordAwnserList = [];
                // randomWordList.add(element);
                while (randomWordAwnserList.length != 3) {
                  int r = random.nextInt(words.length);
                  Word randomWord = words[r];
                  if (!randomWordAwnserList.contains(randomWord) &&
                      randomWord.id != element.id) {
                    randomWordAwnserList.add(randomWord);
                  }
                }
                randomWordAwnserList.add(element);
                randomWordAwnserList.shuffle();
                questions
                    .add(Question(randomWords: randomWordAwnserList, word: element));
              }

              QuizManager quizManager = QuizManager(questions: questions,words: words,chosenWordCounter: chosen);

              return Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider.value(
                              value: quizManager, child: const Challenge())));
                    },
                    child: Text(
                      'start challenge',
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
