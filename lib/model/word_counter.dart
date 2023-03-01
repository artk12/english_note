
import 'package:flutter/material.dart';

class WordCounterFields {
  static const String keyId = 'ID';
  static const String keyWord = 'id_word';
  static const String keyRepeat = 'repeat';
}


class WordCounter {

  int? id;
  int? idWord;
  int? repeat;

  WordCounter({this.idWord,this.repeat,this.id});

  WordCounter.fromJson(Map parsedJson){
    id = parsedJson[WordCounterFields.keyId];
    idWord = parsedJson[WordCounterFields.keyWord];
    repeat = parsedJson[WordCounterFields.keyRepeat];
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