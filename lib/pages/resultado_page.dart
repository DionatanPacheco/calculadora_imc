// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calculadoraimc/widgets/listas_salvas.dart';
import 'package:flutter/material.dart';

import '../model/calcular_imc.dart';

class ResultadoPage extends StatefulWidget {
  final String resultado;
  final String imc;
  final double peso;
  final double altura;

  const ResultadoPage({
    Key? key,
    required this.resultado,
    required this.imc,
    required this.peso,
    required this.altura,
  }) : super(key: key);

  @override
  State<ResultadoPage> createState() => _ResultadoPageState();
}

class _ResultadoPageState extends State<ResultadoPage> {
// ignore: prefer_final_fields
  var _pessoa = <Pessoa>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Resultado Imc'),
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Expanded(
          child: ListView.builder(
              itemCount: _pessoa.length,
              itemBuilder: (context, index) {
                var pessoa = _pessoa[index];
                return ListasSalvas(pessoa: pessoa);
              }),
        ));
  }
}
