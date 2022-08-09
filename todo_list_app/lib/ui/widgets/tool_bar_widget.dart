import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/view_model/all_provider.dart';

class ToolBarWidget extends ConsumerWidget {
  const ToolBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
     final todosCount = ref.watch(onTodoComplatedCount);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Expanded(
          child: Text('$todosCount Görev'),
        ),
        /// tooltip üzerine uzun basıca açıklma yazması için kullanılan bır widget
        Tooltip(
          message: 'All Todos',
          child: TextButton(onPressed: () {}, child: const Text('All')),
        ),
        Tooltip(
          message: 'Only Uncompleted Todos',
          child: TextButton(onPressed: () {}, child: const Text('Active')),
        ),
        Tooltip(
          message: 'Only Completed Todos',
          child: TextButton(onPressed: () {}, child: const Text('Completed')),
        ),
      ],
    );
  }
}
