import 'package:flutter/material.dart';
import 'package:word_learning/screens/tenses/tense_info.dart';

import '../../model/tense.dart';

class TenseCard extends StatelessWidget {
  final Tense tense;
  const TenseCard({Key? key, required this.tense}) : super(key: key);

  Color getBGColor() {
    if (tense.tense == "Present") {
      return const Color(0xDDD36F00);
    } else if (tense.tense == "Future") {
      return const Color(0xF502B771);
    } else {
      return const Color(0xFF629200);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TenseInfo(tense: tense)));
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width / 1.5,
          // height: 60,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: getBGColor(), blurRadius: 4, spreadRadius: 4),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: getBGColor(), width: 1),
          ),
          child: Center(
              child: Text(
            '${tense.name}\n${tense.persionName}',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(height: 1.5, color: getBGColor()),
          )),
        ),
      ),
    );
  }
}
