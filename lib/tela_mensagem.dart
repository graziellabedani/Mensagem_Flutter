import 'package:cartaomensagem/mensagem.dart';
import 'package:flutter/material.dart';

class TelaCartao extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dispositivo de mensagem", style: TextStyle(color: Colors.white,  fontWeight: FontWeight.bold,),),
        backgroundColor: const Color.fromARGB(255, 231, 77, 128),
      ),
      body: Center(
        child: Mensagem(),
      )

    ); 
  }
}