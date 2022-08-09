import 'package:flutter/cupertino.dart';
import 'package:todo_list_app/model/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoListViewModel with ChangeNotifier {
  List<TodoModel> allTodos = [
    TodoModel(
      id: const Uuid().v4(),
      descriptription: 'Spora Git',
      completed: false,
    ),
    TodoModel(
      id: const Uuid().v4(),
      descriptription: 'Kitap Git',
      completed: false,
    ),
  ];

  void addList(String description, String id) {
    allTodos.add(
      TodoModel(
        id: id,
        completed: false,
        descriptription: description,
      ),
    );
    notifyListeners();
  }

  void removeList(String todoId) {
    /// koşulu bulduğu gıbı alltodos listenin o anki değerini veriyor yani todoId = 5 olsun
    /// allTodos.firstWhere((element) => element.id == todoId) = 5 olcak
    allTodos.remove(allTodos.firstWhere((element) => element.id == todoId));
    notifyListeners();
  }

  void toggle(String todoId) {
    for (final element in allTodos) {
      if (element.id == todoId) {
        element.completed = !element.completed!;
        notifyListeners();
      }
    }
  }
}
