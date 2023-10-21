import 'package:calculadoraimc/model/pessoa_sqlite_model.dart';
import 'package:calculadoraimc/pages/resultado_page.dart';
import 'package:calculadoraimc/repositories/pessoa_sqlite_repository.dart';
import 'package:calculadoraimc/widgets/formulario.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    pesoController.text = "";
    alturaController.text = "";
    setState(() {});
  }

  String nome = '';
  double peso = 0;
  double altura = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: const Icon(Icons.refresh_outlined),
          onPressed: () {
            _resetFields();
          }),
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.person_outline,
                    size: 120.0, color: Colors.black),
                Formulario(
                    labelText: 'Digite seu Nome', controller: nomeController),
                Formulario(
                  labelText: 'Digite seu peso',
                  controller: pesoController,
                ),
                Formulario(
                  labelText: "altura",
                  controller: alturaController,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: SizedBox(
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        final pessoa = PessoaSqliteModel(
                          nome: nomeController.text,
                          peso: double.parse(pesoController.text),
                          altura: double.parse(alturaController.text),
                        );

                        await PessoaSqliteRepository().salvarPessoa(pessoa);

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ResultadoPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      child: const Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
