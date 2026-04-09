import 'package:cartaomensagem/tela_mensagem.dart';
import 'package:flutter/material.dart';

class CartaoMensagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartão Aniversário',
      debugShowCheckedModeBanner: false,
      home: TelaCartao(),
    );
  }
}