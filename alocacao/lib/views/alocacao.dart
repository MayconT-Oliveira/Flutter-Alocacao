// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unused_import
import 'package:http/http.dart' as http;

import 'package:alocacao/views/Cliente.dart';
import 'package:alocacao/views/carro.dart';
import 'package:alocacao/views/grupo.dart';
import 'package:flutter/material.dart';

class Alocacao extends StatefulWidget {
  const Alocacao({super.key});

  @override
  State<Alocacao> createState() => _AlocacaoState();
}

class _AlocacaoState extends State<Alocacao> {
  void _abrirGrupo() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Grupo()));
  }

  void _abrirCarro() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Carro()));
  }

  void _abrirCliente() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cliente()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: Color.fromARGB(255, 254, 224, 0)),
                onPressed: () {
                  _abrirGrupo();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.group_work),
                    SizedBox(width: 10),
                    Text("Grupo", style: TextStyle(fontSize: 30))
                  ],
                )),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Color.fromARGB(255, 0, 156, 55)),
              onPressed: () {
                _abrirCarro();
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.car_repair),
                    SizedBox(width: 10),
                    Text("Carro", style: TextStyle(fontSize: 30))
                  ],
                )
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Color.fromARGB(255, 0, 34, 119)),
              onPressed: () {
                _abrirCliente();
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 10),
                    Text("Cliente", style: TextStyle(fontSize: 30))
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
