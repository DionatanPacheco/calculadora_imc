import 'package:intl/intl.dart';

class PessoaSqliteModel {
  int? _id;
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;
  final String _data = DateFormat('dd/MM/yy').format(DateTime.now());
  final double _imc = 0.0;
  String _resultadoImc = "";
  PessoaSqliteModel(
    this._id,
    this._nome,
    this._peso,
    this._altura,
    this._resultadoImc,
  );
  PessoaSqliteModel._();
  int get id => _id ?? 0;
  set id(int id) {
    _id = id;
  }

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  double get peso => _peso;

  set peso(double peso) {
    _peso = peso;
  }

  double get altura => _altura;

  set altura(double altura) {
    _altura = altura;
  }

  String get data => _data;

  double get imc => _imc;

  String get resultadoImc => _resultadoImc;

  static String calculoImc(double peso, double altura) {
    double imc = peso / (altura * altura);
    String resultado = "";
    if (imc < 18.6) {
      resultado =
          'Abaixo do peso \n Procure um nutricionista você está abaixo do peso.';
    } else if (imc >= 18.6 && imc < 24.9) {
      resultado = 'Peso Ideal \n Parabéns você  está no peso ideal.';
    } else if (imc >= 24.9 && imc < 29.9) {
      resultado =
          'Levemente acima do peso \n Preste atenção você está sobrepeso.';
    } else if (imc >= 29.9 && imc < 34.9) {
      resultado =
          'Obesidade grau I \n Cuidado você está entrando em obesidade.';
    } else if (imc >= 34.9 && imc < 39.9) {
      resultado =
          'Obesidade grau II \n Atenção procure um nutricionista você está muito acima do peso.';
    } else if (imc >= 40.0) {
      resultado = 'Obesidade grau III \n Urgênte procure um nutricionista.';
    } else {
      resultado = "Peso ou Altura invalidos, tente novamente!";
    }

    imc = double.parse(imc.toStringAsFixed(2));
    return resultado;
  }
}
