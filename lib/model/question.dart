import 'package:word_learning/model/word.dart';

class QuestionFields {
  static const String keyId = 'ID';
  static const String keyIdWord = 'id_word';
  static const String keyIdQuiz = 'id_quiz';
  static const String keyTimer = 'timer';
  static const String keyCorrectAnswer = 'corrected_answer';
}


class Question {

  Word? word;
  List<Word>? randomWords;
  Question({this.word,this.randomWords});
}

// class Quiz{
//   String? id;
//   int? idWord;
//   int? idQuiz;
//   String? timer;
//   String? correctAnswer;
//
//   Quiz.fromJson(Map parsedJson){
//     id = parsedJson[QuestionFields.keyId];
//     idWord = parsedJson[QuestionFields.keyIdWord];
//     idQuiz = parsedJson[QuestionFields.keyIdQuiz];
//     timer = parsedJson[QuestionFields.keyTimer];
//     correctAnswer = parsedJson[QuestionFields.keyCorrectAnswer];
//   }
//
//   Map toJson(){
//     return{
//       QuestionFields.keyCorrectAnswer:correctAnswer,
//       QuestionFields.keyIdWord:idWord,
//       QuestionFields.keyIdQuiz:idQuiz,
//       QuestionFields.keyTimer : timer,
//     };
//   }
// }