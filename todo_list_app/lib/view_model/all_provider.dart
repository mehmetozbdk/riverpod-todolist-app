import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'todo_view_model.dart';

final todoProvider = ChangeNotifierProvider<TodoListViewModel>((ref) {
  return TodoListViewModel();
});

/// bunu burda tanımlamamın sebebı bir değer için gidio sürekli sayfa build edilmesin
final onTodoComplatedCount = Provider<int>((ref) {
  final allTodo = ref.watch(todoProvider).allTodos;

  /// watch yaparak listeyı dınkeyecek tamamlanmıyanların uzunluğunu counta atıyacak
  final count = allTodo.where((element) => !element.completed!).length;
  return count;
});
