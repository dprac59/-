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

  String _basePath =
      r"C:\Users\PrachDen_95\Desktop\приложение заметок\pox\notes";

  void _saveToFile(String filename, String data) {
    final file = File("$_basePath/$filename");
    file.writeAsStringSync(data);
  }

  String _readFromFile(String filename) {
    final file = File("$_basePath/$filename");
    return file.readAsStringSync();
  }

  List<String> _getAllFilesPaths() {
    final directory = Directory(_basePath);
    return directory
        .listSync()
        .map(
          (e) => e.path,
        )
        .toList();
  }

  @override
  Note addNote(String title, String content, List<String> tags) {
    Note note = Note.no_data(title, content, tags, false);
    _saveToFile("${note.id}.json", jsonEncode(note.toJson()));
    return note;
  }

  @override
  List<Note> getAll() {
    return _getAllFilesPaths()
        .map(
          (e) => Note.fromJson(jsonDecode(_readFromFile(e))),
        )
        .toList();
  }

  @override
  Note edit(int id, String newText) {
    for (var path in _getAllFilesPaths()) {
      final note = Note.fromJson(jsonDecode(_readFromFile(path)));
      if (note.id == id) {
        note.content = newText;
        _saveToFile("${note.id}.json", jsonEncode(note.toJson()));
        return note;
      }
    }

    throw Error();
  }

  @override
  // ignore: non_constant_identifier_names
  Note? ID(int id) {
    throw UnimplementedError();
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
    List<String> paths = all();

    for (var path in paths) {
      Note note = loadNote(path);
      if (note.id == id) {
        final f = File(path);
        f.delete();
      }
    }
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
