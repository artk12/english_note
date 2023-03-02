import 'dart:convert';

class QuizFields {
  static const String keyId = 'ID';
  static const String keyCreatedTime = 'created_time';
  static const String keyWords = 'words';
}

class Quiz {

  int? id;
  DateTime? createdTime;
  List<dynamic>? words;
  List<QuizWord>? quizWords;

  Quiz({this.id, this.createdTime, this.words});

  Quiz.fromJson(Map parsedJson){
    id = parsedJson[QuizFields.keyId];
    createdTime = DateTime.parse(parsedJson[QuizFields.keyCreatedTime]);
    words = jsonDecode(parsedJson[QuizFields.keyWords]);
    quizWords = [];
    for(var element in words!){
      quizWords!.add(QuizWord.fromJson(element));
    }
  }

  Map<String,dynamic> toJson(){
    return {
      QuizFields.keyCreatedTime : createdTime.toString(),
      QuizFields.keyWords : jsonEncode(words),
    };
  }

}

class QuizWord{
  int? idWord;
  int? correct;

  QuizWord.fromJson(Map parseJson){
    idWord = parseJson['id_word'];
    correct = parseJson['correct'];
  }
}
