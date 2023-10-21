import 'package:calculadoraimc/model/pessoa_sqlite_model.dart';
import 'package:calculadoraimc/repositories/pessoa_sqlite_repository.dart';
import 'package:calculadoraimc/widgets/listas_salvas.dart';
import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget {
  const ResultadoPage({
    Key? key,
  }) : super(key: key);

  Future<List<PessoaSqliteModel>> _getPessoas() async =>
      await PessoaSqliteRepository().obterTodasPessoas();

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
      body: FutureBuilder<List<PessoaSqliteModel>>(
        future: _getPessoas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Errro ao carregar os dados'),
            );
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == null) {
            return const Center(
              child: Text('Nenhum dado encontrado'),
            );
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            final pessoas = snapshot.data as List<PessoaSqliteModel>;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: pessoas.length,
              itemBuilder: (context, index) => ListasSalvas(
                pessoa: pessoas[index],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
