
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../model/tense.dart';
import '../model/word.dart';

class LoadFromAssets {

  static Future<String>_load504WordsFromAsset() async {
    return await rootBundle.loadString("assets/words.json");
  }

  static Future<List<Word>> get504Words() async {
    String jsonString = await _load504WordsFromAsset();
    final jsonResponse = jsonDecode(jsonString)['Sheet1'];
    List<Word> words = [];
    for (int i = 0; i < jsonResponse.length; i++) {
      Map<String,dynamic> map =  Word.convertEssentialJsonFormat(jsonResponse[i],i+1);
      words.add(Word.fromJson(map));
    }
    return words;
  }
  static Future<String>_loadTenseFromAsset() async {
    return await rootBundle.loadString("assets/tense.json");
  }

  static Future<List<Tense>> getTenses() async {
    String jsonString = await _loadTenseFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    List<Tense> tenses = [];
    for (int i = 0; i < jsonResponse.length; i++) {
      Tense t =  Tense.formJson(jsonResponse[i]);
      tenses.add(t);
    }
    return tenses;
  }
}