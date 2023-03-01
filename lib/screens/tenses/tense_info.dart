import 'package:flutter/material.dart';

import '../../model/tense.dart';

class TenseInfo extends StatelessWidget {
  final Tense tense;
  const TenseInfo({Key? key, required this.tense}) : super(key: key);

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: const SizedBox.shrink(),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blueGrey,
                )),
          ],
          title: Text(
            tense.name,
            textDirection: TextDirection.rtl,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.blueGrey, height: 1.5),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.blueGrey),
                  children: <TextSpan>[
                    const TextSpan(text: 'اصلا '),
                    TextSpan(
                        text: tense.persionName,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: getBGColor())),
                    const TextSpan(text: ' چی هست !'),
                  ],
                ),
                textScaleFactor: 1.2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                tense.mainDescription,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.blueGrey,height: 1.5),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "بریم چندتا مثال بزنیم : ",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xDD824D23)),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tense.positiveExample.length,
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(10),
                    color: index % 2 == 0 ? Colors.black.withAlpha(15) : Colors.transparent,
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      '${index + 1}. ${tense.positiveExample[index]}',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          height: 1.3,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "با توجه به مثال های بالا میشه فرمول پایین رو برا ${tense.persionName} استخراج کرد.",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                tense.positiveFormula,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.cyan),
              ),
              const SizedBox(height: 20,),
              Container(height: 1,width: double.maxFinite,color: Colors.black26,),
              const SizedBox(height: 20,),
              Text(
                "حالا چجوری منفی کنیم ؟",
                textScaleFactor: 1.2,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                tense.negativeDescription,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.blueGrey,height: 1.5),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "به مثال های پایین توجه کنید : ",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xDD824D23)),
              ),
              const SizedBox(
                height: 10,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tense.negativeExample.length,
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(10),
                    color: index % 2 == 0 ? Colors.black.withAlpha(15) : Colors.transparent,
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      '${index + 1}. ${tense.negativeExample[index]}',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          height: 1.3,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              Text(
                "و اما فرمولش : ",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey),
              ),
              const SizedBox(height: 10,),
              Text(
                tense.negativeFormula,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.redAccent.shade700),
              ),
              const SizedBox(height: 20,),
              Container(height: 1,width: double.maxFinite,color: Colors.black26,),
              const SizedBox(height: 20,),
              Text(
                "پس چجوری سوال بپرسم ؟",
                textScaleFactor: 1.2,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                tense.questionDescription,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.blueGrey,height: 1.5),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "مثال ها رو ببینیم : ",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xDD824D23)),
              ),
              const SizedBox(
                height: 10,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tense.questionExample.length,
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(10),
                    color: index % 2 == 0 ? Colors.black.withAlpha(15) : Colors.transparent,
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      '${index + 1}. ${tense.questionExample[index]}',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          height: 1.3,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              Text(
                "فرمولش : ",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey),
              ),
              const SizedBox(height: 10,),
              Text(
                tense.questionFormula,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.amber.shade900),
              ),
              const SizedBox(height: 60,),
              Text(
                ":) HOPE YOU ENJOY",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.green),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
