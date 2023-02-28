import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/word.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit(super.initialState);

  void onSearch(String? value,List<Word> allWords){
    if(value != null){
      List<Word> searchedWords = allWords.where((element) => element.word.contains(value) || element.translated.contains(value)).toList();
      emit(SearchState(words: searchedWords));
    }else{
      emit(SearchState(words: []));
    }
  }

}

class SearchState{
  List<Word> words;
  SearchState({required this.words});
}