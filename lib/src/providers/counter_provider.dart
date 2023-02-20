import 'package:flutter/material.dart';

class CounterState {
  int _value = 0;

  // Métodos para manipular o estado

  // Método de incremento
  void inc() => _value++;

  // Método de decremento
  void dec() => _value--;

  // get
  int get value => _value;

  // Método para dizer quando é diferente
  bool diff(CounterState old) {
    return old.value != _value;
    // sempre que for diferente, ele precisa atualizar.
  }
}

class CounterProvider extends InheritedWidget {
  // Inicializo o estado do Provider
  final CounterState state = CounterState();

  CounterProvider({required Widget child}) : super(child: child);

  // Método estático para
  static CounterProvider? of(BuildContext context) {
    // A partir do contexto, esse dependOnInheritedWidgetOfExactType() irá pegar
    // uma instância que está disponivel na árvore de componentes.
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(covariant CounterProvider oldWidget) {
    // só vai notificar quando realmente o estado for mudado.
    return oldWidget.state.diff(state);
  }
}
