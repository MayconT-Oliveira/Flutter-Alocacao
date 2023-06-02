import 'package:flutter/material.dart';

class Carro extends StatefulWidget {
  const Carro({super.key});

  @override
  State<Carro> createState() => _CarroState();
}

class _CarroState extends State<Carro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro do Cliente"),
      ),
    );
  }
}