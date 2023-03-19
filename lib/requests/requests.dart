
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:word_learning/database/queries.dart';
import 'package:word_learning/model/quiz.dart';
import 'package:word_learning/model/word.dart';
import 'package:http/http.dart' as http;
import 'package:word_learning/model/word_counter.dart';

class Requests{

  static String baseUrl = "https://fastword.ir/api/";

  static Future<List<Word>> readWords () async{
    var res = await http.post(Uri.parse('${baseUrl}get_words.php'));
    var parsed = jsonDecode(res.body);
    return List<Word>.from(parsed.map((e) => Word.fromJson(e)).toList());
  }

  static Future<List<Quiz>> readQuiz () async{
    var res = await http.post(Uri.parse('${baseUrl}get_quiz.php'));
    var parsed = jsonDecode(res.body);
    return List<Quiz>.from(parsed.map((e) => Quiz.fromJson(e)).toList());
  }
  static Future<List<WordCounter>> readWordCounter () async{
    var res = await http.post(Uri.parse('${baseUrl}get_wordCounter.php'));
    var parsed = jsonDecode(res.body);
    return List<WordCounter>.from(parsed.map((e) => WordCounter.fromJson(e)).toList());
  }

  static Future<String> insertWords(Word w)async{
    await http.post(Uri.parse('${baseUrl}insert_word.php'),body: {
      'query': Queries.insertNewWord(w.word, w.translated, w.sentences, w.description??''),
    });
    return 'done';
  }

  static Future<String> insertQuiz(Quiz quiz)async{
    List<Map> queries = [];
    // queries.add({'query':Queries.insertQuiz(jsonEncode(quiz.words))});
    for (WordCounter item in quiz.wordCounter!){
      queries.add({'query':Queries.updateWordCounter(item.idWord.toString(), (item.repeat! + 1 ).toString())});
    }
    // String splash = r'\';
    await http.post(Uri.parse('${baseUrl}insert_quiz.php'),body: {
      'queries': jsonEncode(queries),
      'words': jsonEncode(quiz.words),
      'created_time': quiz.createdTime.toString(),
    });
    return 'done';
  }


}