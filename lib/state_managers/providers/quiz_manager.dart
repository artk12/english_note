import 'package:flutter/material.dart';
import 'package:word_learning/database/database.dart';
import 'package:word_learning/model/word_counter.dart';
import 'package:word_learning/state_managers/providers/refresh_provider.dart';

import '../../model/question.dart';
import '../../model/quiz.dart';
import '../../model/word.dart';

class QuizManager extends ChangeNotifier{

  int count = 1;
  List<Map<String,int>> questionsRecorde = [];
  List<Question> questions ;
  Word? chosen ;
  bool isSelected = false;
  List<Word> words;
  bool isSavedDetail = false;
  List<WordCounter> chosenWordCounter;

  QuizManager({required this.questions,required this.words,required this.chosenWordCounter});

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
      list.add(words.firstWhere((element) => element.id == id));
    }
    return list;
  }
  get inCorrectedAnswerWord{
    List<Map<String,int>> inCorrectedListMap = questionsRecorde.where((element) => element['correct'] == 0).toList();
    List<Word> list = [];
    for (var element in inCorrectedListMap) {
      int id = element['id_word']!;
      list.add(words.firstWhere((element) => element.id == id));
    }
    return list;
  }

  get getAllQuestionWords{
    List<Word> list = [];
    for (var element in questions){
      list.add(element.word!);
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

  Future saveQuiz(RefreshProvider refreshProvider)async{
    if(!isSavedDetail){
      isSavedDetail = true;
      for(WordCounter counter in chosenWordCounter){

        WordDatabase.instance.updateWordCounter(counter);
      }
      Quiz q = Quiz(words: questionsRecorde,createdTime: DateTime.now());
      WordDatabase.instance.insertQuiz(q);
      Future.delayed(Duration.zero).then((value) {
        refreshProvider.refresh();
      });
    }
  }

}