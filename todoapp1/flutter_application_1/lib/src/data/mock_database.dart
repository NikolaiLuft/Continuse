import 'package:flutter_application_1/src/data/database_repository.dart';
import 'package:flutter_application_1/src/features/domain/todo.dart';

class MockDatabase extends DatabaseRepository {
// Liste an Todods ertsellen
  List<Todo> todos = [];

//Hier unten mit der Todo Liste arbeiten

  @override
  void addTodo(Todo todo) {
    // TODO: implement addTodo gazzar
    todos.add(todo);
  }

  @override
  List<Todo> getTodos() {
    // TODO: implement getTodos
    return todos;
  }

  @override
  void removeTodo(Todo todo) {
    // TODO: implement removeTodo
    todos.remove(todo);
  }

  @override
  void updateTodo(Todo todo, bool isDone) {
    // TODO: implement updateTodo
    todo.isDone = isDone;
  }
}
