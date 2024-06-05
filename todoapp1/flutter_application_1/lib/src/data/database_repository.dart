import 'package:flutter_application_1/src/features/domain/todo.dart';

abstract class DatabaseRepository {
//getTodos
  List<Todo> getTodos();

//addTodo
  void addTodo(Todo todo);

  //removeTodo
  void removeTodo(Todo todo);

  //updateTodo
  void updateTodo(Todo todo, bool isDone);
}
