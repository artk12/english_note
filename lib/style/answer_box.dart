import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_learning/state_managers/providers/quiz_manager.dart';

import '../model/word.dart';

class AnswerBox extends StatelessWidget {
  final Word word;
  const AnswerBox({Key? key,required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizManager quizManager = Provider.of(context);
    Color bg = Colors.white;
    Color txtColor = Colors.blueGrey;

    bool isChosen = false;
    if(quizManager.chosen != null){
      isChosen = quizManager.chosen!.id == word.id;
    }
    bool isCorrectAnswer = quizManager.checkAnswerOnTap(word);

    if(quizManager.isSelected != false){
      if(isCorrectAnswer){
        bg = Colors.green;
        txtColor = Colors.white;
      }
      if(isChosen && isCorrectAnswer ){
        bg = Colors.green;
        txtColor = Colors.white;
      }else if(isChosen && !isCorrectAnswer){
        bg = Colors.red;
        txtColor = Colors.white;
      }
    }

    return Container(
      width: MediaQuery.of(context).size.width/2,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bg,
          boxShadow: const [
            BoxShadow(color: Colors.grey,blurRadius: 15,spreadRadius: 2)
          ],
        border: Border.all(color: Colors.black38,width: 0.5),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(word.translated,style: Theme.of(context).textTheme.headline1!.copyWith(color: txtColor),)),
    );
  }
}
