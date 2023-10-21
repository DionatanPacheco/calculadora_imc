import 'package:calculadoraimc/model/pessoa_sqlite_model.dart';
import 'package:flutter/material.dart';

class ListasSalvas extends StatelessWidget {
  final PessoaSqliteModel pessoa;

  const ListasSalvas({super.key, required this.pessoa});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Nome: ${pessoa.nome}'),
          const SizedBox(height: 4),
          Text('Peso: ${pessoa.peso} kg'),
          const SizedBox(height: 4),
          Text('Altura: ${pessoa.altura} cm'),
          const SizedBox(height: 4),
          Text(pessoa.resultadoImc ?? '')
        ],
      ),
    );
  }
}
