//итоговый фал выполняющий бизнес логикуу и обьединяющий все файлы

import 'dart:io';

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
    answer = int.parse(stdin.readLineSync(answer));
    switch (answer) {
      case 1:
      case 2:
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
