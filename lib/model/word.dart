import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WordFields {
  static const String keyId = 'ID';
  static const String keyWord = 'word';
  static const String keyTranslated = 'translated';
  static const String keySentences = 'sentences';
  static const String keyDescription = 'description';
  static const String keyYear = 'year';
  static const String keyMonth = 'month';
  static const String keyDay = 'day';
  static const String keyLesson = 'lesson';
}

class Word {
  int? id;
  String word;
  String translated;
  String sentences;
  String? description;
  int year;
  int month;
  int day;
  int? lesson;

  Word(
      {required this.word,
      required this.translated,
      required this.sentences,
      this.description,
      required this.year,
      required this.day,
      required this.month,
      this.id,
      this.lesson});

  Word copyWith(
          {int? id,
          String? word,
          String? translated,
          String? sentences,
          String? description,
          int? year,
          int? month,
          int? lesson,
          int? day}) =>
      Word(
          word: word ?? this.word,
          translated: translated ?? this.translated,
          sentences: sentences ?? this.sentences,
          description: description ?? this.description,
          year: year ?? this.year,
          day: day ?? this.day,
          lesson: lesson ?? this.lesson,
          month: month ?? this.month);

  static Word fromJson(Map<String, dynamic> map) {

    return Word(
      id: map[WordFields.keyId],
      word: map[WordFields.keyWord],
      translated: map[WordFields.keyTranslated],
      sentences: map[WordFields.keySentences],
      description: map[WordFields.keyDescription],
      year: int.parse(map[WordFields.keyYear].toString()),
      day: int.parse(map[WordFields.keyDay].toString()),
      month: int.parse(map[WordFields.keyMonth].toString()),
      lesson: int.parse(map[WordFields.keyLesson].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        WordFields.keyId: id,
        WordFields.keyWord: word,
        WordFields.keyTranslated: translated,
        WordFields.keySentences: sentences,
        WordFields.keyDescription: description,
        WordFields.keyYear: year,
        WordFields.keyMonth: month,
        WordFields.keyDay: day,
        WordFields.keyLesson : lesson,
      };

  static Map<String, dynamic> convertEssentialJsonFormat(Map params,int id) {
    String word = params['word'];
    String lesson = params['lesson'].toString();
    String translated = params['Persian'];
    String description = params['definition'];
    Map<String, String> sentence = {
      '0': params['example1'],
      '1': params['example2'],
      '2': params['example3']
    };
    // DateTime dateTime = DateTime.now();
    String year = '0';
    String month = '0';
    String day = '0';

    return {
      WordFields.keyId: id,
      WordFields.keyLesson : lesson,
      WordFields.keyWord: word,
      WordFields.keyTranslated: translated,
      WordFields.keySentences: jsonEncode(sentence),
      WordFields.keyDescription: description,
      WordFields.keyYear: year,
      WordFields.keyMonth: month,
      WordFields.keyDay: day,
    };
  }

  // Future<String>_loadFromAsset() async {
  //   return await rootBundle.loadString("assets/quiz.json");
  // }
  //
  // Future parseJson() async {
  //   String jsonString = await _loadFromAsset();
  //   final jsonResponse = jsonDecode(jsonString);
  // }

}
