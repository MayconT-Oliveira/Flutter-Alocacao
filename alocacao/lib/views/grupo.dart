// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_final_fields, unused_field, unused_import
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class Grupo extends StatefulWidget {
  const Grupo({super.key});

  @override
  State<Grupo> createState() => _GrupoState();
}

class _GrupoState extends State<Grupo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _descricao = TextEditingController();
  TextEditingController _valor = TextEditingController();
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Voltar para home"),
          content: new Text("Salvo com sucesso."),
          actions: <Widget>[
            // define os botões na base do dialogo
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

   salvarGrupo(var des, var valor) async {
    final response = await http.post(
      Uri.parse('http://192.168.56.1:8080/adicionar-grupo'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'descricaoGrupo': des,
        'valorDiariaGrupo': valor,
        'dataCriacao': "2023-05-16",
        'dataAtualizacao': "2023-05-16",
        'status': 'true'
      }),
    );

    if (response.statusCode == 200) {
       _showDialog();
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      // _showDialogErro();
      throw Exception('falha na criacao do grupo.');
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro do Grupo"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 254, 224, 0),
      ),
      body: Form(
          key: _formKey,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _descricao,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Descrição do Grupo"),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, inserir um valor.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _valor,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Valor Diaria"),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, inserir um valor.';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            backgroundColor: Color.fromARGB(255, 254, 224, 0)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                ],
              ))),
    );
  }
}
