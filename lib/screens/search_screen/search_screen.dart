import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:word_learning/database/database.dart';
import 'package:word_learning/state_managers/cubits/search_cubit.dart';
import 'package:word_learning/style/text_fields.dart';
import 'package:word_learning/widgets/home_page_widget/card_widget.dart';

import '../../model/word.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var words = Provider.of<List<Word>?>(context);

    if (words == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    SearchCubit searchCubit = SearchCubit(SearchState(words: []));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          padding: const EdgeInsets.only(top: 15),
          height: double.maxFinite,
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              Expanded(
                  child: MyTextFields.searchBox((value) {
                if (value.isEmpty) {
                  searchCubit.onSearch(null, words);
                } else {
                  searchCubit.onSearch(value, words);
                }
              }, context, hint: 'search everything...')),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: WordDatabase.instance.readAllWord(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return BlocBuilder(
            bloc: searchCubit,
            builder: (context, SearchState state) {
              if (state.words.isEmpty) {
                return Center(
                  child: Text(
                    'Nothing to show...',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.blueGrey.withAlpha(150)),
                  ),
                );
              }
              return ListView.builder(
                  itemCount: state.words.length,
                  itemBuilder: (context, index) =>
                      WordCard(word: state.words[index], index: index));
            },
          );
        },
      ),
    );
  }
}
