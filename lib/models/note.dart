// это класс заметок он нужен для создания обьектов типа заметки они включают в себя айди имя текст время создания и обновления а также теги  и проверку на любимость
//этот класс обладает проверками  геттерами и сеттерами

import 'dart:math';

var random = Random();

class Note {
  final int _id;
  String _title;
  String _content;
  final DateTime _createdAt;
  DateTime _updatedAt;
  List<String> _tags;
  bool _isFavorite;

  ///Основной конструктор заметок
  Note(int id, String title, String content, DateTime createdAt,
      DateTime updatedAt, List<String> tags, bool isFavorite)
      : _id = id,
        _title = title,
        _content = content,
        _createdAt = createdAt,
        _isFavorite = isFavorite,
        _tags = tags,
        _updatedAt = updatedAt;

  Note.no_data(String title, String content, List<String> tags, bool isFavorite)
      : _content = content,
        _title = title,
        _tags = tags,
        _isFavorite = isFavorite,
        _id = random.nextInt(1000000000000000000),
        _createdAt = DateTime.now(),
        _updatedAt = DateTime.now();

  int get id => _id;
  String get title => _title;
  set title(String titleText) {
    _title = titleText;
    _updatedAt = DateTime.now();
  }

  String get content => _content;
  set content(String contentText) {
    _content = contentText;
    _updatedAt = DateTime.now();
  }

  DateTime get createdAt => _createdAt;
  DateTime get updatedAt => _updatedAt;
  List<String> get tags => _tags;
  set tags(List<String> tagsText) {
    _tags = tagsText;
    _updatedAt = DateTime.now();
  }

  bool get isFavorite => _isFavorite;
  set isFavorite(bool boolingText) {
    _isFavorite = boolingText;
  }
}
