import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // classe sem estado
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Imc(),
    );
  }
}

class Imc extends StatefulWidget { // classe com estado
  const Imc({super.key});

  @override
  State<Imc> createState() => _HomePageState();
}

class _HomePageState extends State<Imc> {
  TextEditingController alturaController = new TextEditingController(); // texto
  TextEditingController pesoController = new TextEditingController(); // texto
  String _textoInfo = "Informe seus dados"; // texto

  void _limpar_Tela(){  // refresh
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _textoInfo = "informe seus dados";
    });
  }
  void _calcular_Imc(){
    setState(() {

      double peso = double.parse(pesoController.text); // variavel peso
      double altura = double.parse(alturaController.text); // variavel altura
      double imc = peso / pow((altura/100), 2); // calculo do imc

      if(imc <16.5){
        _textoInfo = "Desnutrido(${imc})"; // se o imc for menor que 16.5 aparecerá desnutrido
      }
      else if(imc<=18.5){
        _textoInfo = "Abaixo do peso(${imc})"; // se o imc for menor ou igual a 18.5 aparecera abaixo do peso
      }
      else if(imc<=24.9){
        _textoInfo = "Peso ideal(${imc})"; // se o imc for menor ou igual que 24.9 aparecera peso ideal
      }
      else if(imc<=29.9){
        _textoInfo = "Sobre peso(${imc})";
      }
      else if(imc<=34.9){
        _textoInfo = "Obesidade Grau 1 (${imc})";
      }
      else if(imc<=39.9){
        _textoInfo = "Obesidade Grau 2 (${imc})";
      }
      else {
        _textoInfo = "Obesidade Grau 3 (${imc})";
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"), // texto
        centerTitle: true, // titulo no centro
        backgroundColor: Colors.blue, // cor do fundo
        actions: <Widget>[
          IconButton(onPressed: _limpar_Tela, icon: Icon(Icons.refresh)) // botao de refresh
        ],
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),

          child: Column( // coluna
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              const Icon( // icone
                Icons.person_outline,
                size: 120.0, // tamanho
                color: Colors.lightBlueAccent, //cor
              ),
              TextField( // texto
                keyboardType: TextInputType.number, // teclado de numero
                decoration: InputDecoration(
                    labelText: "PESO (KG)", // texto peso
                    labelStyle: TextStyle(color: Colors.blue) // cor
                ),

                textAlign: TextAlign.center, // texto alinhado no centro
                style: TextStyle(fontSize: 25.0),
                controller: pesoController,
              ),

              TextField(
                keyboardType: TextInputType.number, // teclado de numero
                decoration: InputDecoration(
                    labelText: "ALTURA (CM) ",
                    labelStyle: TextStyle(color: Colors.blue)
                ),

                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
                controller: alturaController,
              ),
              Padding( // estilizar
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: _calcular_Imc,
                      child: const Text("Calcular")
                  ),
                ),
              ),
              Text(
                _textoInfo,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25.0
                ),
              )
            ],
          )
      ),
    );
  }
}
