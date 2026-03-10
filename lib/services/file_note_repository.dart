// это репозитроий позволяющий работать с классом напрямую делает все что и делает класс
//
//
//
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
    // TODO: implement addNote
    throw UnimplementedError();
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
}
