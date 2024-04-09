import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // classe sem estado
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Contador(),
    );
  }
}

class Contador extends StatefulWidget { // classe com estado
  const Contador ({super.key});

  @override
  State<Contador> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Contador> {
  int _counter = 0;

  void _incrementCounter() { // adicionar mais um
    setState(() {

      _counter++;
    });
  }
  void _incrementCounter1() { // tirar  um
    setState(() {

      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('contador'),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            Row( // linha
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  ElevatedButton( // botao
                    onPressed: _incrementCounter, // adicionar
                    child: const Icon(Icons.add),),
                  ElevatedButton( // botao
                    onPressed: _incrementCounter1, // remover
                    child: const Icon(Icons.remove),)
                ]),

          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
    );
  }
}