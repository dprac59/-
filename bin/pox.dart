//итоговый фал выполняющий бизнес логикуу и обьединяющий все файлы

import 'dart:io';

import 'package:pox/models/note.dart';
import 'package:pox/services/fake_note_reposiroty.dart';

FakeNoteReposiroty fakeNoteReposiroty = FakeNoteReposiroty();
void main() {
  int answer;
  bool isWork = true;
  while (isWork) {
    print("1. Создать заметку");
    print("2. Просмотреть все заметки");
    print("3. Просмотреть заметку по ID");
    print("4. Редактировать заметку");
    print("5. Удалить заметку");
    print("6. Поиск заметок");
    print("7. Сортировка заметок");
    print("8. Экспорт заметок");
    print("9. Выход");
    print("Input.....");
    answer = int.parse(stdin.readLineSync() ?? "0");
    switch (answer) {
      case 1:
        create();
      case 2:
        visualAll();
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
        isWork == false;
    }
  }
}

void create() {
  print("Enter a name ...");
  String name = stdin.readLineSync() ?? "0";
  print("Enter a text...");
  String text = stdin.readLineSync() ?? "0";
  final bool anser = askUser("Do you want give a tag to this?");
  final bool ans_2 = askUser("Do you want mark as favorite ?");
  bool isfavoriteThere = false;
  List<String> tagList = [];
  if (anser) {
    print("Enter a tag...");
    String tagName = stdin.readLineSync() ?? "Empty_tag";
    tagList.add(tagName);
  }
  if (ans_2) {
    isfavoriteThere = true;
  } else {
    isfavoriteThere = false;
  }
  Note.no_data(name, text, tagList, isfavoriteThere);
}

bool askUser(String question) {
  print("$question Y/N");
  String text = stdin.readLineSync() ?? "N";
  text = text.toLowerCase();

  if (text == "y" || text == "д") {
    return true;
  }

  return false;
}

void visualAll() {
  print("All notes");
  List<Note> list = fakeNoteReposiroty.getAll();
  for (var note in list) {
    print(note);
  }
}
