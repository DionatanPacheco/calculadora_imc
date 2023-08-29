import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados!";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
    });
  }

  void _calculo() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.6) {
        _infoText =
            "Abaixo do peso (${imc.toStringAsPrecision(4)})\n \n \n Procure um nutricionista você está abaixo do peso.";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText =
            "Peso Ideal (${imc.toStringAsPrecision(4)})\n \n \n Parabéns você  está no peso ideal.";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText =
            "Levemente acima do peso (${imc.toStringAsPrecision(4)})\n \n \n Preste atenção você está sobrepeso.";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText =
            "Obesidade grau I (${imc.toStringAsPrecision(4)})\n \n \n Cuidado você está entrando em obesidade.";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText =
            "Obesidade grau II (${imc.toStringAsPrecision(4)})\n \n \n Atenção procure um nutricionista você está muito acima do peso.";
      } else if (imc >= 40.0) {
        _infoText =
            "Obesidade grau III (${imc.toStringAsPrecision(4)})\n \n \n Urgênte procure um nutricionista.";
      }
    });
  }

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
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      focusColor: Colors.black,
                      suffixIconColor: Colors.black,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 10,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: "Peso (kg)",
                      labelStyle: TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 25.0),
                  controller: weightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira seu peso!";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      focusColor: Colors.black,
                      suffixIconColor: Colors.black,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 10,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 25.0),
                  controller: heightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira sua altura!";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: SizedBox(
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _calculo();
                        }
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
                Text(
                  _infoText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 25.0),
                )
              ],
            ),
          )),
    );
  }
}
