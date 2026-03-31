//итоговый фал выполняющий бизнес логикуу и обьединяющий все файлы

import 'dart:io';

import 'package:pox/models/note.dart';
import 'package:pox/services/file_note_repository.dart';

FileNoteRepository fakeNoteReposiroty = FileNoteRepository();
void main() {
  int answer;
  bool isWork = true;
  while (isWork) {
    print("1. Создать заметку");
    print("2. Просмотреть все заметки");
    print("3. Просмотреть заметку по тексту");
    print("4. Редактировать заметку");
    print("5. Удалить заметку");
    print("6. Сортировка заметок");
    print("7. Экспорт заметок");
    print("8. Выход");
    print("Input.....");
    answer = int.parse(stdin.readLineSync() ?? "0");
    switch (answer) {
      case 1:
        create();
      case 2:
        visualAll();
      case 3:
        searchTxt();
      case 4:
        editTxt();
      case 5:
        del();
      case 6:
        sort();
      case 7:
        export();
      case 8:
        isWork = false;
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
  fakeNoteReposiroty.addNote(name, text, tagList);
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
    print(note.toString());
  }
}

void searchTxt() {
  String txt;
  print("Searching by text");
  print("Enter text ");
  txt = stdin.readLineSync() ?? "0";

  final list = fakeNoteReposiroty.searchTXT(txt);
  for (var note in list) {
    print(note);
  }
}

void del() {
  print("Enter name of note... ");
  String txt = stdin.readLineSync() ?? "0";

  final list = fakeNoteReposiroty.searchTXT(txt);
  if (list.length == 1) {
    print("Note founded!");
    print(list);
  } else {
    return;
  }

  final bool ans = askUser("Do you want to delete this note?");
  if (ans) {
    fakeNoteReposiroty.delNote(list.first.id);
  }
}

sort() {
  fakeNoteReposiroty.sort();
}

editTxt() {
  print("Enter name of note... ");
  String txt = stdin.readLineSync() ?? "0";

  final list = fakeNoteReposiroty.searchTXT(txt);
  if (list.length == 1) {
    print("Note founded!");
    print(list);
  } else {
    return;
  }
  final bool ans = askUser("Do you want to change text of  this note?");
  if (ans) {
    print("Enter new text for note...");
    String newText = stdin.readLineSync() ?? "0";
    list.first.content = newText;
    print("-----New changes: $newText --------");
  }
}

export() {
  print("Exporting a note....");
  final bool ans = askUser("Do you want to export this note to json ?");
  if (ans) {
    print("enter a dir where export...");
  }
}
