import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'Note.dart';

class DBHelper with ChangeNotifier {
  DBHelper._();
  static DBHelper dbHelper = DBHelper._();

  static const String noteTitleColumn = "noteTitle";
  static const String noteDescriptionColumn = 'notedescription';
  static const String noteColorColumn = 'noteColor';

  static List<Note> allNotes = [];

  Future<Database> initDataBase() async {
    Database database = await connectToDatabase();
    return database;
  }

  Future<Database> connectToDatabase() async {
    Directory appfolder = await getApplicationDocumentsDirectory();
    String appPath = appfolder.path;
    String dbPath = join(appPath, "NoteApp.db");
    Database database = await openDatabase(dbPath, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT  , $noteTitleColumn  TEXT, $noteDescriptionColumn TEXT, $noteColorColumn INTEGER )');
    }, onOpen: (database) {
      print(database.path);
      print('table created');
    }, version: 1);
    return database;
  }

  Future<int> insertNewNote(Note note) async {
    Database db = await initDataBase();
    var result =
        await db.insert("note", note.toMap()).then((value) => note.id = value);

    notifyListeners();
    return result;
  }

  deleteNote(int? id) async {
    Database db = await initDataBase();
    db.delete("note", where: "id=?", whereArgs: [id]);
    notifyListeners();
  }

  updateNote(Note note, int? id) async {
    try {
      Database db = await initDataBase();
      db.update("note", note.toMap(), where: "id=?", whereArgs: [id]);
    } on Exception catch (e) {
      print("The Error here $e");
    }
  }

  Future<Note> getSpecifucNote(int id) async {
    Database db = await initDataBase();
    List result =
        await db.query("note", where: "id:?", whereArgs: [id], limit: 1);
    Note note = Note.fromMap(result.first);
    notifyListeners();
    return note;
  }

  Future<List<Note>> getAllNote() async {
    Database db = await initDataBase();

    List noteMap = await db.query('note');
    return List.generate(noteMap.length, (index) {
      return Note.fromMap(noteMap[index]);
    });
  }
}
