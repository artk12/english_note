import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../model/word.dart';
import '../../state_managers/providers/quiz_manager.dart';

class ChallengeEnd extends StatelessWidget {
  const ChallengeEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizManager quizManager = Provider.of(context);
    List<Word> correctedListMap = quizManager.correctedAnswerWord;
    List<Word> inCorrectedListMap = quizManager.inCorrectedAnswerWord;
    int correctedAnswerCounter = correctedListMap.length;
    int inCorrectedAnswerCounter = inCorrectedListMap.length;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg.jpeg'), fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "All right, quiz's over.",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.blueGrey),
                  )),
                  // const Spacer(flex: 1,),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                    "Lets go and see what happen!",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.blueGrey),
                  )),
                  // const Spacer(flex: 1,),
                  const SizedBox(
                    height: 50,
                  ),
                  CircularPercentIndicator(
                    radius: 90,
                    lineWidth: 3.0,
                    percent: correctedAnswerCounter / 10,
                    center: Text("${correctedAnswerCounter * 10} percentage",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Colors.amber.shade700, fontSize: 17)),
                    backgroundColor: const Color(0x64ff0000),
                    animation: true,
                    progressColor: const Color(0xbd2aff00),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // const Spacer(flex: 1,),
                  Column(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Text('Correct',style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.green)),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            child: Text(
                              '$correctedAnswerCounter Answer correct',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: Colors.green),
                            ),
                          ),
                          Wrap(
                            children: List.generate(
                              correctedListMap.length,
                              (index) => Container(
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
                                        blurRadius: 15,
                                        spreadRadius: 2)
                                  ],
                                ),
                                child: Text(
                                  correctedListMap[index].word,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(color: Colors.green.shade800),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const Spacer(flex: 1,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            child: Text(
                              '$inCorrectedAnswerCounter Answer wrong',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: Colors.red),
                            ),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.center,
                            children: List.generate(
                              inCorrectedListMap.length,
                              (index) => Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.red.shade800),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.red,
                                        blurRadius: 15,
                                        spreadRadius: 2)
                                  ],
                                ),
                                child: Text(
                                  inCorrectedListMap[index].word,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // const Spacer(flex: 1,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
