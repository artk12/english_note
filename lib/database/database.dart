import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:word_learning/load_assets/load_assets.dart';
import 'package:word_learning/model/word.dart';
import 'package:word_learning/model/word_counter.dart';

import '../model/quiz.dart';

class WordDatabase {
  static final WordDatabase instance = WordDatabase._init();
  static const String tableContent = 'words';
  static Database? _database;

  WordDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 4, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS words ( ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,lesson INTEGER NOT NULL, word VARCHAR(100) NOT NULL , translated  VARCHAR(100) NOT NULL ,sentences JSON NOT NULL,description TEXT NOT NULL  , year VARCHAR(4) NOT NULL ,month VARCHAR(2) NOT NULL ,day VARCHAR(2) NOT NULL )');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS quiz ( ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, created_time VARCHAR(30) NOT NULL , words JSON NOT NULL)');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS word_counter ( ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, id_word  INTEGER,repeat  INTEGER NOT NULL )');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS question ( ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, id_word  INTEGER, id_quiz INTEGER ,timer VARCHAR(30) NOT NULL , corrected_answer  VARCHAR(100) NOT NULL )');
  }

  Future saveWordGroup(List<Word> words) async {
    for (var element in words) {
      insertWord(element);
    }
  }

  Future<Word> insertWord(Word w) async {
    final db = await instance.database;
    int wordId = await db.insert('words', w.toJson());
    await db.insert(
        'word_counter', WordCounter(idWord: wordId, repeat: 0).toJson());
    return w.copyWith(id: wordId);
  }

  Future<void> insertQuiz(Quiz q) async {
    final db = await instance.database;
    await db.insert('quiz', q.toJson());
  }

  Future<int> deleteWord(int id) async {
    final db = await instance.database;
    await db.delete('word_counter',
        where: '${WordCounterFields.keyWord} = ?', whereArgs: [id]);
    return await db
        .delete('words', where: '${WordFields.keyId} = ?', whereArgs: [id]);
  }

  Future<int> updateWord(Word w) async {
    final db = await instance.database;
    return await db.update('words', w.toJson(),
        where: '${WordFields.keyId} = ?', whereArgs: [w.id]);
  }

  Future updateWordCounter(WordCounter w) async {
    final db = await instance.database;
    WordCounter updated = w.copyWith(repeat: w.repeat! +1);
    debugPrint(updated.toJson().toString());
    var t = await db.update('word_counter', updated.toJson() ,where: '${WordCounterFields.keyId} = ?', whereArgs: [updated.id]);
    debugPrint(t.toString());
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<List<Word>> readAllWord() async {
    final db = await instance.database;
    final result = await db.query(
      'words',
      orderBy: "ID DESC",
    );

    if (result.isEmpty) {
      List<Word> words = await LoadFromAssets.get504Words();
      saveWordGroup(words);
      return words;
    }
    return result.map((e) => Word.fromJson(e)).toList();
  }

  Future<List<WordCounter>> readAllWordCounter() async {
    final db = await instance.database;
    final result = await db.query(
      'word_counter',
    );

    return result.map((e) => WordCounter.fromJson(e)).toList();
  }
  Future<List<Quiz>> readAllQuizzes() async {
    final db = await instance.database;
    final result = await db.query(
      'quiz',
    );
    return result.map((e) => Quiz.fromJson(e)).toList();
  }
}
