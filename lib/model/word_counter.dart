
import 'package:flutter/material.dart';

class WordCounterFields {
  static const String keyId = 'ID';
  static const String keyWord = 'id_word';
  static const String keyRepeat = 'counter';
}


class WordCounter {

  int? id;
  int? idWord;
  int? repeat;

  WordCounter({this.idWord,this.repeat,this.id});

  WordCounter.fromJson(Map parsedJson){
    id = int.parse(parsedJson[WordCounterFields.keyId].toString());
    idWord = int.parse(parsedJson[WordCounterFields.keyWord].toString());
    repeat = int.parse(parsedJson[WordCounterFields.keyRepeat].toString());
  }

  Map<String,dynamic> toJson(){
    return {
      WordCounterFields.keyId:id,
      WordCounterFields.keyWord:idWord,
      WordCounterFields.keyRepeat:repeat,
    };
  }

  WordCounter copyWith({int? id,int? idWord,int? repeat}){
    return WordCounter(id: id??this.id,idWord: idWord??this.idWord,repeat: repeat??this.repeat);
  }

}