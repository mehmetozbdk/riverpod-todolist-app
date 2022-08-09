import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/view_model/all_provider.dart';

class TodoListItem extends ConsumerWidget {
  const TodoListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTodos = ref.watch(todoProvider).allTodos;
    log('TodoListItem');
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (_) {
            ref.read(todoProvider.notifier).removeList(allTodos[index].id!);
          },
          child: ListTile(
            leading: Checkbox(
              value: allTodos[index].completed,
              onChanged: (value) {
                ref.watch(todoProvider.notifier).toggle(allTodos[index].id!);
              },
            ),
            title: Text(allTodos[index].descriptription!,
                style: ref.watch(todoProvider).allTodos[index].completed!
                    ? const TextStyle(decoration: TextDecoration.lineThrough,
                      decorationThickness: 3)
                    : const TextStyle()),
          ),
        );
      },
      itemCount: allTodos.length,
    );
  }
}
