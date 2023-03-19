
class Queries{

  static String insertNewWord(String word,String translated,String sentences,String description){
    DateTime now = DateTime.now();
    return "INSERT INTO `words`(`lesson`, `word`, `translated`, `sentences`, `description`, `year`, `month`, `day`) VALUES ('1','$word','$translated','$sentences','$description','${now.year}','${now.month}','${now.day}')";
  }

  static String insertQuiz(String words){
    DateTime now = DateTime.now();
    return "INSERT INTO `quiz`(`created_time`, `words`) VALUES (.${now.toString()}.,.$words.)";
  }

  static String updateWordCounter(String idWord,String counter){
    return "UPDATE `word_counter` SET `counter`=.$counter. WHERE `id_word`=.$idWord. ";

    return "INSERT INTO `word_counter`(`id_word`, `counter`) VALUES ('${idWord.toString()}','${counter.toString()}')";
  }

}