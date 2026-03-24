// это репозитроий позволяющий работать с классом напрямую делает все что и делает класс
//
//
//
import 'dart:convert';
import "dart:io";
import 'dart:math';
import 'package:pox/models/note.dart';
import 'package:pox/services/note_repository.dart';

class FileNoteRepository extends NoteRepository {
  FileNoteRepository() {}

  @override
  Note? ID(int id) {
    // TODO: implement ID
    throw UnimplementedError();
  }

  @override
  Note addNote(String title, String content, List<String> tags) {
    Note note = Note.no_data(title, content, tags, false);

    File note_create = File("./$title.json");
    print(note_create.create());
    note_create.writeAsString(json.encode(note.toJson()));
    return note;
  }

  @override
  void delNote(int id) {
    // TODO: implement delNote
  }

  @override
  List<Note> searchTXT(String searchTXT) {
    // TODO: implement searchTXT
    throw UnimplementedError();
  }

  @override
  List<Note> sort() {
    // TODO: implement sort
    throw UnimplementedError();
  }

  @override
  List<Note> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}

void all() {
  var myDir =
      Directory(r'C:\Users\PrachDen_95\Desktop\приложение заметок\pox\notes\');
  try {
    for (var entity in myDir.listSync()) {
      print(entity.path);
    }
  } catch (ex) {
    print(ex);
  }
}

Note loadNote(String path) {
  File note = File(path);
  String info = note.readAsStringSync();
  final decoded = json.decode(info);
  Note note_1 = Note.fromJson(decoded);
  return note_1;
}

void main(List<String> args) {
  all();
}
