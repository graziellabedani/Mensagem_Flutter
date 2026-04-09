import 'package:flutter/material.dart';

class Mensagem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MensagemState();
  }
}

class _MensagemState extends State<Mensagem> {

  // Controllers
  final _destinatarioController = TextEditingController();
  final _mensagemController = TextEditingController();
  final _remetenteController = TextEditingController();

  // Dados do cartão
  String destinatario = "";
  String mensagem = "";
  String remetente = "";

  void criarCartao() {
    if (_destinatarioController.text.isEmpty ||
        _mensagemController.text.isEmpty ||
        _remetenteController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Preencha todos os campos!")),
      );
      return;
    }

    setState(() {
      destinatario = _destinatarioController.text;
      mensagem = _mensagemController.text;
      remetente = _remetenteController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // evita overflow
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Envie sua Mensagem!",
            style: TextStyle(
              fontSize: 20,
              color: Colors.pink,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),

          Column(
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _destinatarioController,
                  decoration: InputDecoration(
                    labelText: "Digite o nome do destinatário",
                  ),
                ),
              ),

              SizedBox(height: 10),

              SizedBox(
                width: 300,
                child: TextField(
                  controller: _mensagemController,
                  decoration: InputDecoration(
                    labelText: "Digite uma mensagem",
                  ),
                ),
              ),

              SizedBox(height: 10),

              SizedBox(
                width: 300,
                child: TextField(
                  controller: _remetenteController,
                  decoration: InputDecoration(
                    labelText: "Digite o nome do remetente",
                  ),
                ),
              ),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: criarCartao,
                child: Text(
                  'Criar Cartão',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.pink),
                ),
              ),
            ],
          ),

          SizedBox(height: 30),

          // 🔽 CARTÃO APARECE AQUI
          if (destinatario.isNotEmpty)
            Container(
              width: 320,
              height: 200,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/teste.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [

                  // Topo esquerdo (Destinatário)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Para $destinatario",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Centro (Mensagem)
                  Center(
                    child: Text(
                      mensagem,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                  ),

                  // Inferior direito (Remetente)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "De $remetente",
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}