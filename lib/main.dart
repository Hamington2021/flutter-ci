import 'package:flutter/material.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Counter Lab',
    theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
    home: const CounterPage(),
  );
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _value = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Counter Lab')),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Current count'),
          Text(
            '$_value',
            key: const ValueKey('counter-value'),
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 20),
          FilledButton(
            key: const ValueKey('increment'),
            onPressed: () => setState(() => _value++),
            child: const Text('+'),
          ),
        ],
      ),
    ),
  );
}
