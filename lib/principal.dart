import 'package:flutter/material.dart';

class Principal extends StatefulWidget {   // Classe com estado
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}
class _PrincipalState extends State<Principal>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagina Inicial'), // titulo
          centerTitle: true, // centralizar
          backgroundColor: Colors.purpleAccent,  // cor
        ),
        body: SingleChildScrollView(  // rolar para baixo
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Column( // alinhar em colunas
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Icon(
                  Icons.add_business_sharp, // icone
                  size: 120.0, // tamanho do icone
                  color: Colors.deepPurpleAccent, // cor do icone
                ),
                ElevatedButton(  // botao
                  child: const Text('Levar para IMC'),
                  onPressed: () {  // "quando pressiona"
                    Navigator.pushNamed(context, '/imc');  // vai ir para a pagina do imc
                  },
                ),
                ElevatedButton(  // botao
                  child: const Text('Levar para Contador'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/contador'); // vai ir para a pagina o contador
                  },
                ),
                ElevatedButton( // botao
                  child: const Text('Levar para Usuario'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/usuario'); // vai ir para usuario
                  },
                ),
                ElevatedButton( // botao
                  child: const Text('Levar para Produto'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/produto'); // vai ir pra produto
                  },
                ),
              ]
          ),
        )
    );
  }
}
