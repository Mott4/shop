import 'package:flutter/material.dart';
import 'package:shop/src/providers/counter_provider.dart';

class CounterPagePage extends StatefulWidget {
  // Transformar a tela para StatefulWidget para ter acesso ao
  // estado da página
  const CounterPagePage({
    super.key,
  });

  @override
  State<CounterPagePage> createState() => _CounterPagePageState();
}

class _CounterPagePageState extends State<CounterPagePage> {
  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        actions: const [
          Center(child: Text('Counter Page')),
        ],
      ),
      body: Column(
        children: [
          Text(provider?.state.value.toString() ?? '0'),
          IconButton(
            onPressed: () {
              // Chamar os métodos dentro de um SetState
              // ^^ Só assim irá funcionar para mudar o estado da aplicação
              setState(() {
                provider?.state.inc();
                print(provider?.state.value);
              });
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                provider?.state.dec();
                print(provider?.state.value);
              });
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
