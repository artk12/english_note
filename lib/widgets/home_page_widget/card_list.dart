import 'package:flutter/material.dart';
import 'package:word_learning/widgets/home_page_widget/card_widget.dart';
import '../../model/word.dart';

class WordList extends StatelessWidget {
  final List<Word> words;
  const WordList({Key? key, required this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      shrinkWrap: true,
      itemCount: words.length,
      itemBuilder: (context, index) {
        return WordCard(
          word: words[index],
          index: index,
        );
      },
    );
  }
}
/*
double median(Array a) {
  var middle = a.length ~/ 2;
  if (a.length % 2 == 1) {
    return a[middle];
  } else {
    return (a[middle - 1] + a[middle]) / 2.0;z
  }
}
 */