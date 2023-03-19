import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:word_learning/model/word_counter.dart';
import 'package:word_learning/widgets/statistics_widget/quiz_card.dart';

import '../../model/quiz.dart';
import '../../model/word.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  Widget rowsDetail(String title, int number, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.blueGrey),
        ),
        Text(
          number.toString(),
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.green.shade600),
        )
      ],
    );
  }

  Widget line() {
    return Container(
      height: 1,
      width: double.maxFinite,
      color: Colors.black26,
    );
  }

  @override
  Widget build(BuildContext context) {
    // List<Word> words = Provider.of<List<Word>>(context);
    List<WordCounter> counter = Provider.of<List<WordCounter>>(context);
    List<Quiz> quizzes = Provider.of<List<Quiz>>(context);
    int wordAnswered = 0;
    int correct = 0;
    int wrong = 0;

    for (Quiz item in quizzes) {
      wordAnswered += item.quizWords!.length;
      correct +=
          item.quizWords!.where((element) => element.correct == 1).length;
      wrong += item.quizWords!.where((element) => element.correct == 0).length;
    }
    double percentageCorrect = (correct / wordAnswered) * 100;
    double percentageWrong = (wrong / wordAnswered) * 100;
    List<Quiz> reversedQuizList = quizzes.reversed.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blueGrey,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Statistics",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.blueGrey),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            rowsDetail('Number of quizzes', quizzes.length, context),
            const SizedBox(
              height: 10,
            ),
            line(),
            const SizedBox(
              height: 10,
            ),
            rowsDetail('Number of words', counter.length, context),
            const SizedBox(
              height: 10,
            ),
            line(),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: CircularPercentIndicator(
                      radius: 100.0,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.red,
                      percent: percentageWrong > 9
                          ? percentageWrong / 100
                          : percentageWrong / 10,
                      animation: true,
                      animationDuration: 1500,
                      center: const Icon(
                        Icons.person_pin,
                        size: 100,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 110.0,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.green,
                    percent: percentageCorrect > 9
                        ? percentageCorrect / 100
                        : percentageCorrect / 10,
                    animation: true,
                    animationDuration: 1500,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                CircularPercentIndicator(
                  radius: 20.0,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.green,
                  percent: percentageCorrect > 9
                      ? percentageCorrect / 100
                      : percentageCorrect / 10,
                  animation: true,
                  animationDuration: 1500,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                  '${percentageCorrect.toInt()} percentage of answers is correct',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.green),
                ))
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                CircularPercentIndicator(
                  radius: 20.0,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.red,
                  percent: percentageWrong > 9
                      ? percentageWrong / 100
                      : percentageWrong / 10,
                  animation: true,
                  animationDuration: 1500,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                  '${percentageWrong.toInt()} percentage of answers is wrong',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.red),
                ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            line(),
            const SizedBox(
              height: 30,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: reversedQuizList.length,
              itemBuilder: (context, index) => QuizCard(
                  quiz: reversedQuizList[index],
                  index: reversedQuizList.length - index),
            )
          ],
        ),
      ),
    );
  }
}
