import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_learning/widgets/tense_widget/tense.dart';

import '../../model/tense.dart';

class TensesScreen extends StatelessWidget {
  const TensesScreen({Key? key}) : super(key: key);

  Widget tenseTitle(BuildContext context, String title, Color color) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 1,
          color: color,
        )),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 23, color: color),
            )),
        Expanded(
            child: Container(
          height: 1,
          color: color,
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var tenses = Provider.of<List<Tense>>(context);
    List<Tense> futureTenses =
        tenses.where((element) => element.tense == "Future").toList();
    List<Tense> presentTenses =
        tenses.where((element) => element.tense == "Present").toList();
    List<Tense> pastTenses =
        tenses.where((element) => element.tense == "Past").toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blueGrey,
            )),
        title: Text(
          'زمان ها در انگلیسی',
          textDirection: TextDirection.rtl,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.blueGrey, height: 1.5),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Text(
                  'زمان شکلی از فعل است که به شما امکان می دهد زمان را بیان کنید. زمان فعل به ما می گوید که چه زمانی یک رویداد یا چیزی وجود داشته است یا زمانی که شخصی کاری را انجام داده است. گذشته، حال و آینده سه نوع اصلی زمان هستند در ادامه انواع زمانها در انگلیسی را معرفی میکنیم',
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.blueGrey,
                    height: 1.5,
                    shadows: [
                      Shadow(
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 5.0,
                        color: Colors.blueGrey.shade100,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              tenseTitle(context, "آینده", const Color(0xF502B771)),
              Wrap(
                children: List.generate(futureTenses.length,
                    (index) => TenseCard(tense: futureTenses[index])),
              ),
              const SizedBox(
                height: 15,
              ),
              tenseTitle(context, "حال", const Color(0xDDD36F00)),
              Wrap(
                children: List.generate(presentTenses.length,
                    (index) => TenseCard(tense: presentTenses[index])),
              ),
              const SizedBox(
                height: 15,
              ),
              tenseTitle(context, "گذشته", const Color(0xFF629200)),
              Wrap(
                children: List.generate(pastTenses.length,
                    (index) => TenseCard(tense: pastTenses[index])),
              ),
              // Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: ),
            ],
          ),
        ),
      ),
    );
  }
}
