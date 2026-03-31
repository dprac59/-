// это репозитроий позволяющий работать с классом напрямую делает все что и делает класс
//
//
//
import 'dart:convert';
import "dart:io";
import 'package:pox/models/note.dart';
import 'package:pox/services/note_repository.dart';

class FileNoteRepository extends NoteRepository {
  FileNoteRepository();

  @override
  // ignore: non_constant_identifier_names
  Note? ID(int id) {
    throw UnimplementedError();
  }

  @override
  Note addNote(String title, String content, List<String> tags) {
    Note note = Note.no_data(title, content, tags, false);

    File noteCreate = File("./$title.json");
    print(noteCreate.create());
    noteCreate.writeAsString(json.encode(note.toJson()));
    return note;
  }

  @override
  List<Note> searchTXT(String searchTXT) {
    var notes = getAll();
    List<Note> searchnote = notes.where((test) {
      String str = "${test.title} ${test.content}";
      return str.contains(searchTXT);
    }).toList();
    return searchnote;
  }

  @override
  List<Note> sort() {
    var notes = getAll();
    notes.sort((a, b) => a.title.length.compareTo(b.title.length));
    return notes;
  }

  @override
  List<Note> getAll() {
    List<String> paths = all();
    List<Note> notes = [];
    for (var path in paths) {
      Note note = loadNote(path);
      notes.add(note);
    }
    return notes;
  }

  List<String> all() {
    var myDir = Directory(
        r'C:\Users\PrachDen_95\Desktop\приложение заметок\pox\notes\');
    List<String> note = [];
    try {
      for (var entity in myDir.listSync()) {
        final not = entity.path;
        note.add(not);
      }
    } catch (ex) {
      print(ex);
    }
    return note;
  }

  @override
  void delNote(int id) {
    var notes = getAll();
    Note noteremove = notes.firstWhere((test) => test.id == id);
    notes.remove(noteremove);
  }
}

List<String> all() {
  var myDir =
      Directory(r'C:\Users\PrachDen_95\Desktop\приложение заметок\pox\notes\');
  List<String> note = [];
  try {
    for (var entity in myDir.listSync()) {
      final not = entity.path;
      note.add(not);
    }
  } catch (ex) {
    print(ex);
  }
  return note;
}

Note loadNote(String path) {
  File note = File(path);
  String info = note.readAsStringSync();
  final decoded = json.decode(info);
  Note note_1 = Note.fromJson(decoded);
  return note_1;
}
