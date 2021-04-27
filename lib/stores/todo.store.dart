part 'todo.store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @action
  void add(Todo todo) {
    todos.add(todo);
  }
}