import 'dart:math';

import 'package:pox/models/note.dart';
import 'package:pox/services/note_repository.dart';

class FakeNoteReposiroty extends NoteRepository {
  List<Note> _notes = [];

  @override
  Note? ID(int id) {
    Note note_id = _notes.firstWhere((test) => test.id == id);

    return note_id;
  }

  @override
  Note addNote(String title, String content, List<String> tags) {
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
      String str = test.title + " " + test.content;
      return str.contains(searchTXT);
    }).toList();
    return searchnote;
  }

  @override
  List<Note> sort() {
    // TODO: implement sort
    throw UnimplementedError();
  }
}
