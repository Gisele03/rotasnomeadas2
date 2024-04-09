import 'dart:math';

import 'package:flutter/material.dart';



class MyApp extends StatelessWidget { // classe sem estado
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Produto(),
    );
  }
}

class Produto extends StatefulWidget { //classe com estado
  const Produto({super.key});

  @override
  State<Produto> createState() => _HomePageState();
}

class _HomePageState extends State<Produto> {
  TextEditingController produtoController = new TextEditingController();
  TextEditingController precoController = new TextEditingController();
  String _textoInfo = "Informe seu produto";

  void _limpar_Tela(){
    produtoController.text = "";
    precoController.text = "";
    setState(() {
      _textoInfo = "informe os dados";
    });
  }
  void _cadastrar(){
    produtoController.text = "";
    precoController.text = "";

    String produto = produtoController.text;
    String preco = precoController.text;
    if(produto.isEmpty || preco.isEmpty){
      _textoInfo = "Erro ao cadastrar produto";    }
    else {
      _textoInfo = "produto cadastrado com sucesso!";
    }
    setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de produto"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        actions: <Widget>[
          IconButton(onPressed: _limpar_Tela, icon: Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              const Icon(
                Icons.shopping_bag,
                size: 120.0,
                color: Colors.greenAccent,
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Produto",
                    labelStyle: TextStyle(color: Colors.black)
                ),

                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
                controller: produtoController,
              ),

              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Preço ",
                    labelStyle: TextStyle(color: Colors.black)
                ),

                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
                controller: precoController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: _cadastrar,
                      child: const Text("Cadastrar")
                  ),
                ),
              ),
              Text(
                _textoInfo,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0
                ),
              )
            ],
          )
      ),
    );
  }
}
