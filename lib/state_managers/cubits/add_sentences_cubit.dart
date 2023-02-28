import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SentencesCubit extends Cubit<SentencesCubitState>{
  SentencesCubit(super.initialState);

  void addSentences(){
    var list = super.state.controllers;
    list!.add(TextEditingController());
    emit(SentencesCubitState(controllers:list));
  }

  void removeSentences(int index){
    var list = super.state.controllers!;
    list.removeAt(index);
    emit(SentencesCubitState(controllers: list));
  }

}

class SentencesCubitState {
  List<TextEditingController>? controllers ;
  SentencesCubitState({this.controllers});
}