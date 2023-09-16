// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:math';

class Pessoa {
  final int? id;
  final double peso;
  final double altura;
  Pessoa({
    this.id,
    required this.peso,
    required this.altura,
  });

  double _imc = 0;
  String imcEquacao() {
    _imc = peso / pow(altura / 100, 2);
    return _imc.toStringAsFixed(1);
  }

  resultado() {
    if (_imc < 18.6) {
      return 'Abaixo do peso \n Procure um nutricionista você está abaixo do peso.';
    } else if (_imc >= 18.6 && _imc < 24.9) {
      return 'Peso Ideal \n Parabéns você  está no peso ideal.';
    } else if (_imc >= 24.9 && _imc < 29.9) {
      return 'Levemente acima do peso \n Preste atenção você está sobrepeso.';
    } else if (_imc >= 29.9 && _imc < 34.9) {
      return 'Obesidade grau I \n Cuidado você está entrando em obesidade.';
    } else if (_imc >= 34.9 && _imc < 39.9) {
      return 'Obesidade grau II \n Atenção procure um nutricionista você está muito acima do peso.';
    } else if (_imc >= 40.0) {
      return 'Obesidade grau III \n Urgênte procure um nutricionista.';
    }
  }
}
