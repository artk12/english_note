import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_learning/database/database.dart';
import 'package:word_learning/load_assets/load_assets.dart';
import 'package:word_learning/model/tense.dart';
import 'package:word_learning/model/word.dart';

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
    //read all data from the json file
    WidgetsFlutterBinding.ensureInitialized();
    String jsonString = await rootBundle.loadString("assets/words.json");
    final jsonResponse = jsonDecode(jsonString)['Sheet1'];
    //parse the json file
    print(jsonResponse[0]);
    List<Word> words = [];
  });

  test('test read tenses json', () async {
    //read all data from the json file
    WidgetsFlutterBinding.ensureInitialized();
    List<Tense> tenses = await LoadFromAssets.getTenses();
    print(tenses.length);
    print("good job bro :)");
  });
}
