import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/quiz.dart';
import '../../model/word.dart';

class QuizCard extends StatelessWidget {
  final int index;
  final Quiz quiz;
  const QuizCard({Key? key,required this.quiz,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Word> words = Provider.of<List<Word>>(context);
    List<Word> correctedWords = [];
    List<Word> wrongWords = [];
    if(words.isNotEmpty){
      quiz.quizWords?.forEach((element) {
        if(element.correct == 1){
          correctedWords.add(words.firstWhere((item) => element.idWord == item.id));
        }else{
          wrongWords.add(words.firstWhere((item) => element.idWord == item.id));
        }
      });
    }


    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quiz number $index",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.blueGrey),),
                  Text("Created in ${quiz.createdTime!.year}/${quiz.createdTime!.month}/${quiz.createdTime!.day}",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontStyle: FontStyle.italic,color: Colors.blueGrey),),
                ],
              ),
              const SizedBox(height:10 ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: List.generate(correctedWords.length, (index) => Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.green.shade800),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.green,
                            blurRadius: 3,
                            spreadRadius: 1)
                      ],
                    ),
                    child: Text(
                      correctedWords[index].word,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.green.shade800),
                    ),
                  ),),
                ),
              ),const SizedBox(height:10 ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Wrong answer",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.red),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: List.generate(wrongWords.length, (index) => Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.red.shade800),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.red,
                            blurRadius: 3,
                            spreadRadius: 1)
                      ],
                    ),
                    child: Text(
                      wrongWords[index].word,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.red.shade800),
                    ),
                  ),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
