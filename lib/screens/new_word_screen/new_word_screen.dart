import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_learning/database/database.dart';
import 'package:word_learning/state_managers/cubits/add_sentences_cubit.dart';
import 'package:word_learning/style/text_fields.dart';

import '../../model/word.dart';

class AddNewWordScreen extends StatelessWidget {
  const AddNewWordScreen({Key? key}) : super(key: key);

  Widget buildSentencesFiled(int index, TextEditingController controller,
      BuildContext context, Function() onPressDelete) {
    if (index == 0) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: MyTextFields.shortTextField(controller, context,
            hint: 'write sentences here...'),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: MyTextFields.shortTextField(controller, context,
                  hint: 'write sentences here...'),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.redAccent),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: onPressDelete,
                  icon: const Icon(
                    CupertinoIcons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  Map<String,String> convertToKeyStringMap(Map<int,String> intMap){
    Map<String,String> convertedMap = {};
    intMap.forEach((key, value) {
      convertedMap.putIfAbsent(key.toString(), () => value);
    });
    return convertedMap;
  }

  @override
  Widget build(BuildContext context) {
    SentencesCubit sentencesCubit = SentencesCubit(
        SentencesCubitState(controllers: [TextEditingController()]));
    TextEditingController descriptionController = TextEditingController();
    TextEditingController wordController = TextEditingController();
    TextEditingController translateController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Word'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Word',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.blueGrey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextFields.shortTextField(wordController, context,
                    hint: 'write your word here...'),
                const SizedBox(
                  height: 10,
                ),
                MyTextFields.shortTextField(translateController, context,
                    hint: 'write your translation...'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sentences',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.blueGrey),
                    ),
                    TextButton(
                        onPressed: () {
                          sentencesCubit.addSentences();
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                width: 1, color: Colors.blue.withOpacity(0.3)),
                          ),
                        ),
                        child: Text(
                          'add new',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.blueGrey),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder(
                    bloc: sentencesCubit,
                    builder: (context, SentencesCubitState state) {
                      return Column(
                        children: List.generate(
                            state.controllers!.length,
                            (index) => buildSentencesFiled(
                                index,
                                state.controllers![index],
                                context,
                                () => {sentencesCubit.removeSentences(index)})),
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Description',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.blueGrey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextFields.longTextField(descriptionController, context,
                    hint: 'write description here...'),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(onPressed: () {
                  if(formKey.currentState!.validate()){
                    DateTime now = DateTime.now();
                    List<String> sentencesList = [];
                    sentencesList.addAll(sentencesCubit.state.controllers!.map((e) => e.text));
                    String sentences = jsonEncode(convertToKeyStringMap(sentencesList.asMap()));
                    Word newWord = Word(word: wordController.text,translated: translateController.text,sentences: sentences,month: now.month,day: now.day,year: now.year,description: descriptionController.text.isEmpty ?'':descriptionController.text);
                    WordDatabase.instance.insertWord(newWord).then((value){
                      Navigator.of(context).pop();
                    });
                  }
                }, child: const Text('submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
