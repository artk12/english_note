class QuizFields {
  static const String keyId = 'ID';
  static const String keyCreatedTime = 'created_time';
  static const String keyEndTime = 'end_time';
  static const String keyIsDone = 'is_done';
}

class Quiz {

  String? id;
  DateTime? createdTime;
  DateTime? endTime;
  bool? isDone;

  Quiz.fromJson(Map parsedJson){
    id = parsedJson[QuizFields.keyId];
    createdTime = DateTime.parse(parsedJson[QuizFields.keyCreatedTime]);
    endTime = DateTime.parse(parsedJson[QuizFields.keyEndTime]);
    isDone = parsedJson[QuizFields.keyIsDone] == '0'?false:true;
  }

  Map<String,dynamic> toJson(){
    return {
      QuizFields.keyCreatedTime : createdTime.toString(),
      QuizFields.keyEndTime : endTime.toString(),
      QuizFields.keyIsDone : '0',
    };
  }

}
