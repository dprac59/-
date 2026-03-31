// это репозитроий позволяющий работать с классом напрямую делает все что и делает класс
//
//
//

import 'dart:math';
import 'package:pox/models/note.dart';
import 'package:pox/services/note_repository.dart';

class FakeNoteReposiroty extends NoteRepository {
  final List<Note> _notes = [Note.no_data("qwe", "saddasdasdasasd", [], false)];

  @override
  Note edit(int id, String newText) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  // ignore: non_constant_identifier_names
  Note? ID(int id) {
    Note noteId = _notes.firstWhere((test) => test.id == id);

    return noteId;
  }

  @override
  Note addNote(String title, String content, List<String> tags) {
    // ignore: non_constant_identifier_names
    Note Fnote = Note(Random().nextInt(10000), title, content, DateTime.now(),
        DateTime.now(), tags, false);

    _notes.add(Fnote);
    return Fnote;
  }

  @override
  void delNote(int id) {
    Note noteremove = _notes.firstWhere((test) => test.id == id);
    _notes.remove(noteremove);
  }

  @override
  List<Note> searchTXT(String searchTXT) {
    List<Note> searchnote = _notes.where((test) {
      String str = "${test.title} ${test.content}";
      return str.contains(searchTXT);
    }).toList();
    return searchnote;
  }

  @override
  List<Note> sort() {
    _notes.sort((a, b) => a.title.length.compareTo(b.title.length));
    return _notes;
  }

  List<Note> getAll() {
    return _notes;
  }
}
