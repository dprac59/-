import 'package:pox/models/note.dart';

class NoteRepository {
  List<Note> _notes = [];

  ///добавить заметку
  Note addNote(String title, String content, List<String> tags) {
    throw UnimplementedError();
  }

  ///удалить заметку
  void delNote(int id) {
    throw UnimplementedError();
  }

  ///поиск по тексту
  List<Note> searchTXT(String searchTXT) {
    throw UnimplementedError();
  }

  ///сортировка заметок
  List<Note> sort() {
    throw UnimplementedError();
  }

  ///поиск по айди
  Note? ID(int id) {
    throw UnimplementedError();
  }
}
