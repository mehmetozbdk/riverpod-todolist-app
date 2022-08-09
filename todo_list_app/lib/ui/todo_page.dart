import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/ui/widgets/text_title_widget.dart';
import 'package:todo_list_app/ui/widgets/todo_list_item.dart';
import 'package:todo_list_app/ui/widgets/tool_bar_widget.dart';
import 'package:todo_list_app/view_model/all_provider.dart';
import 'package:uuid/uuid.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoPageState();
}

class _TodoPageState extends ConsumerState<TodoPage> {
  late TextEditingController textController;
  @override
  void initState() {
    // [textController] intilaize
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    /// durum nesnesi kaldırıldığında değişkenlere ayrılan belleği serbest bırakmak için kullanılan bir yöntem
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('TodoPage');
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          children: [
            const TextTitleWidget(),
            const SizedBox(height: 10),
            TextFormField(
              controller: textController,
              onFieldSubmitted: (value) {
                ref
                    .read(todoProvider.notifier)
                    .addList(value, const Uuid().v4());
              },
            ),
            const SizedBox(height: 10),
            const ToolBarWidget(),
            const SizedBox(height: 10),
            /*   for (int i = 0; i < allTodos.length; i++)
              Dismissible(
                key: UniqueKey(),
                onDismissed: (_) {
                  ref.read(todoProvider.notifier).removeList(i);
                },
                child: ListTile(
                  leading: Checkbox(
                    value: allTodos[i].completed,
                    onChanged: (value) {
                      ref.watch(todoProvider.notifier).toggle(value!, i);
                    },
                  ),
                  title: Text(allTodos[i].descriptription!),
                ),
              ), */
            const TodoListItem(),
            const SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}
