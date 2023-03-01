import 'dart:convert';

class QuizFields {
  static const String keyId = 'ID';
  static const String keyCreatedTime = 'created_time';
  static const String keyWords = 'words';
  // static const String keyEndTime = 'end_time';
  // static const String keyIsDone = 'is_done';
}

class Quiz {

  String? id;
  DateTime? createdTime;
  List<Map>? words;

  Quiz({this.id, this.createdTime, this.words});

  Quiz.fromJson(Map parsedJson){
    id = parsedJson[QuizFields.keyId];
    createdTime = DateTime.parse(parsedJson[QuizFields.keyCreatedTime]);
    words = jsonDecode(parsedJson[QuizFields.keyWords]);
  }

  Map<String,dynamic> toJson(){
    return {
      QuizFields.keyCreatedTime : createdTime.toString(),
      QuizFields.keyWords : jsonEncode(words),
    };
  }

}
