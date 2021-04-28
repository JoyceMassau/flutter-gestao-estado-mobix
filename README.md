# gestao_estado_mobx

Mobx é um pacote que trabalha com ação, reação e estado:
- Toda mudança de estado causa uma reação
- Toda ação causa uma mudança de estado que gera, por sua vez, uma reação

- No *pubspec.yaml* incluir as dependências *"mobx"* e *"flutter_mobx"* e no dev_dependencies o *"build_runner"* e o *"mobx_codegen"*

*Observação:* Stores vão para a memória da aplicação. É inviável colocar todos os produtos de uma grande lista em um store, por exemplo.

Ao trabalharmos com stores usamos um mixin chamado Store, para isso, na nossa classe usamos a palavra reservada "with" e fazemos referência. Dessa forma podemos utilizar dentro da classe os @observable e os @action

```dart
class TodoStore with Store {
    ...
}
```

O Mobx parte da premissa de que a gente nunca altera um observável sem passar por um action

O Mobx gera um arquivo com a extensão .g.dart que nunca devemos alterar. Para impossibilitar que sejam alteras informações que não podem ser alteradas, a classe ToDo store será transformada em abstrata e alterada sua visibilidade para privada, impossibilitando de poder ser instanciada e alterada posteriormente

```dart
import 'package:gestao_estado_mobix/models/todo.model.dart';
import 'package:mobx/mobx.dart';
part 'todo.store.g.dart';

abstract class _TodoStore with Store {
    @observable
    ObservableList<Todo> todos = ObservableList<Todo>();

    @action
    void add(Todo todo) {
        todos.add(todo);
    }
}
```

Para podermos usar uma instância de TodoStore faremos da seguinte forma, onde _$TodoStore vem do arquivo .g.dart criado

```dart
class TodoStore = _TodoStore with _$TodoStore;
```

Para executar as features das dependências que colocamos no pubspec.yaml, no terminal:
- flutter packages pub run build_runner clean (sempre dar esse comando primeiro, com exceção da primeira vez, pois não terá nada)
- flutter packages pub run build_runner build

**Explicação:** o clean irá apagar todos os arquivos.g.dart da aplicação

### Referências

- [Flutter e MobX em menos de 15 minutos! | por André Baltieri #balta](https://www.youtube.com/watch?v=EwrhsoyK0u4)