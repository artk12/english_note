import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_learning/database/database.dart';
import 'package:word_learning/load_assets/load_assets.dart';
import 'package:word_learning/model/quiz.dart';
import 'package:word_learning/model/tense.dart';
import 'package:word_learning/model/word.dart';
import 'package:word_learning/model/word_counter.dart';
import 'package:word_learning/requests/requests.dart';

main() {
  test('test read all word function', () async {
    String json = '{"0":"hello the fucking world"}';
    List<String> sentences = [];
    Map map = jsonDecode(json);
    map.forEach((key, value) {
      sentences.add(value);
    });
    print(sentences.toString());
  });

  test('test read all word json', () async {
    List<Word> words = await Requests.readWords();
    debugPrint(words.length.toString());
  });

  test('test read all word counter json', () async {
    List<WordCounter> quiz = await Requests.readWordCounter();
    debugPrint(quiz.length.toString());
  });
  // test('add all words', () async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   List<Word> words = await LoadFromAssets.get504Words();
  //   for (var element in words) {
  //     String res = await Requests.insertWords(element);
  //     debugPrint(res.toString());
  //   }
  // });



  test('test read tenses json', () async {
    //read all data from the json file
    WidgetsFlutterBinding.ensureInitialized();
    List<Tense> tenses = await LoadFromAssets.getTenses();
    print(tenses.length);
    print("good job bro :)");
  });

  test('test insert request', () async {
    //read all data from the json file
    WidgetsFlutterBinding.ensureInitialized();
    List<Word> words = await LoadFromAssets.get504Words();
    WordDatabase.instance.saveWordGroup(words);
  });
}
