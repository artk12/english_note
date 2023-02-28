import 'dart:convert';
import 'package:flutter/material.dart';
import '../../model/word.dart';

class WordCard extends StatefulWidget {
  final Word word;
  // final bool isFocus;
  final int index;
  const WordCard({Key? key, required this.word, required this.index})
      : super(key: key);

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    // var focusProvider = Provider.of<FocusProvider>(context);
    // var state = focusProvider.states[widget.index];

    return GestureDetector(
      onTap: () {
        if (_animation.status != AnimationStatus.completed) {
          _controller.forward();
        } else {
          _controller.animateBack(0,
              duration: const Duration(milliseconds: 250));
        }
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 3,
                offset: Offset(0, 0))
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              top: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                height: 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.word.word,
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.blueGrey),
                      ),
                      Text(
                        '=',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.red),
                      ),
                      Text(
                        widget.word.translated,
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.green.shade600),
                      ),
                    ],
                  ),
                  SizeTransition(
                    sizeFactor: _animation,
                    child: FadeTransition(
                      opacity: _animation,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          SentencesWidget(sentences: widget.word.sentences),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: Colors.blueGrey),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Definition : ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(color: Colors.blueGrey)),
                                      TextSpan(
                                          text: widget.word.description ??
                                              'no description'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SentencesWidget extends StatelessWidget {
  final String sentences;
  const SentencesWidget({Key? key, required this.sentences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var map = jsonDecode(sentences);
    List<String> sentencesList = [];
    map.forEach((key, value) {
      sentencesList.add(value);
    });

    return Column(
        children: List.generate(
      sentencesList.length,
      (index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 3,
              backgroundColor: Colors.amber.shade200,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                sentencesList[index],
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.blueGrey, fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
