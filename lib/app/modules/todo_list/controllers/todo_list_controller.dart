import 'package:get/get.dart';
import 'package:new_project/app/modules/todo_list/model/todo_model.dart';

class TodoListController extends GetxController {
  final todoList = <TodoModel>[].obs;

  void addTodo(TodoModel todo) {
    todoList.add(todo);
  }

  void removeTodo(int index) {
    todoList.removeAt(index);
  }
}
