import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_learning/model/question.dart';
import 'package:word_learning/screens/challenge/challenge_end.dart';
import 'package:word_learning/state_managers/providers/quiz_manager.dart';
import 'package:word_learning/style/progress/correct.dart';
import 'package:word_learning/style/progress/incorrect.dart';
import 'package:word_learning/style/progress/waiting.dart';

import '../../main.dart';
import '../../style/answer_box.dart';

class Challenge extends StatelessWidget {
  const Challenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizManager quizManager = Provider.of(context);
    Question question = quizManager.question;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg.jpeg'), fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: List.generate(
                  10,
                  (index) {
                    try {
                      var q = quizManager.questionsRecorde[index];
                      if (q['correct'] == 1) {
                        return const CorrectBox();
                      } else {
                        return const InCorrectBox();
                      }
                    } catch (e) {
                      return const WaitingBox();
                    }
                  },
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueAccent, width: 0.5),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.blueAccent,
                          blurRadius: 15,
                          spreadRadius: 2)
                    ],
                  ),
                  child: Text(
                    'questions number #${quizManager.count}',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.blueAccent),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Center(
                  child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.grey,
                    shadows: <Shadow>[
                      const Shadow(
                        blurRadius: 10.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  children: <TextSpan>[
                    const TextSpan(text: 'What the meaning of'),
                    TextSpan(
                      text: ' ${question.word!.word} ',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: Colors.amber,
                        fontSize: 25,
                        shadows: <Shadow>[
                          const Shadow(
                            blurRadius: 12.0,
                            color: Colors.yellowAccent,
                          ),
                        ],
                      ),
                    ),
                    // const TextSpan(text: '?'),
                  ],
                ),
              )),
              const Spacer(
                flex: 1,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: List.generate(
                  4,
                  (index) => TextButton(
                    onPressed: () async {
                      quizManager.updateChosen(question.randomWords![index]);
                      Future.delayed(const Duration(seconds: 0)).then((value) {
                        quizManager.answerQuestion(question.word!,
                            question.randomWords![index].translated);
                      });
                      if (quizManager.count == 10) {
                        Future.delayed(const Duration(seconds: 0)).then(
                          (value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChangeNotifierProvider.value(
                                  value: quizManager,
                                  child: const ChallengeEnd(),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    child: ChangeNotifierProvider.value(
                      value: quizManager,
                      child: AnswerBox(
                        word: question.randomWords![index],
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
