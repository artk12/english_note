
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
    id = parsedJson['ID'];
    idWord = parsedJson['id_word'];
    repeat = parsedJson['repeat'];
  }

  Map<String,dynamic> toJson(){
    return {
      'id_word':idWord,
      'repeat':repeat,
    };
  }

}