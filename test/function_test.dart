import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_learning/database/database.dart';
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
    // for (int i = 0; i < jsonResponse.length; i++) {
    //   Map<String,dynamic> map =  Word.convertEssentialJsonFormat(jsonResponse[i]);
    //   words.add(Word.fromJson(map));
    // }
  });
}
