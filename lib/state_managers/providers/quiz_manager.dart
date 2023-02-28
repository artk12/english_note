import 'package:flutter/material.dart';

import '../../model/question.dart';
import '../../model/word.dart';

class QuizManager extends ChangeNotifier{

  int count = 1;
  List<Map<String,int>> questionsRecorde = [];
  List<Question> questions ;
  Word? chosen ;
  bool isSelected = false;
  List<Word> words;

  QuizManager({required this.questions,required this.words});

  bool checkAnswerOnTap(Word word){
    return questions[count-1].word!.translated == word.translated;
  }

  bool checkAnswer(String translated,Word word){
    return translated == word.translated;
  }

  void updateChosen(Word chosen){
    this.chosen = chosen;
    isSelected = true;
    notifyListeners();
  }

  get correctedAnswerWord{
    List<Map<String,int>> correctedListMap = questionsRecorde.where((element) => element['correct'] == 1).toList();
    List<Word> list = [];
    for (var element in correctedListMap) {
      int id = element['id_word']!;
      list.add(words[id]);
    }
    return list;
  }
  get inCorrectedAnswerWord{
    List<Map<String,int>> inCorrectedListMap = questionsRecorde.where((element) => element['correct'] == 0).toList();
    List<Word> list = [];
    for (var element in inCorrectedListMap) {
      int id = element['id_word']!;
      list.add(words[id]);
    }
    return list;
  }

  get question => questions[count-1];

  answerQuestion(Word word,String translated){
    bool correct = checkAnswer(translated,word);
    isSelected = false;
    questionsRecorde.add({
      'id_word': word.id!,
      'correct': correct?1:0
    });
    if(count < 10){
      ++count;
    }
    notifyListeners();
  }




}