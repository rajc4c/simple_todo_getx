import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/todo_list_controller.dart';
import '../model/todo_model.dart';

class TodoListView extends GetView<TodoListController> {
  const TodoListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoListView'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.addTodo(TodoModel('New Todo #${controller.todoList.length + 1} '));
        },
      ),
      body: Obx(
        () {
          if (controller.todoList.isEmpty) {
            return const Center(child: Text('No Todos\nPlease add one'));
          }
          return Center(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.todoList[index].title),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => controller.removeTodo(index),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: controller.todoList.length,
            ),
          );
        },
      ),
    );
  }
}
