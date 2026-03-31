//репозиторий сделанный на основе абстрактного класс для определения
//работы какую должен выполнять итогвый код
//
//
//

import 'package:pox/models/note.dart';

abstract class NoteRepository {
  ///добавить заметку
  Note addNote(String title, String content, List<String> tags);

  ///удалить заметку
  void delNote(int id);

  ///поиск по тексту
  List<Note> searchTXT(String searchTXT);

  ///сортировка заметок
  List<Note> sort();

  ///поиск по айди
  Note? ID(int id);

  List<Note> getAll();

  Note edit(int id, String newText);
}
