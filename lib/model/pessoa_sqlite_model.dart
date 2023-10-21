class PessoaSqliteModel {
  final int? id;
  final String nome;
  final double peso;
  final double altura;
  final String? data;
  final double? imc;
  final String? resultadoImc;

  PessoaSqliteModel({
    this.id,
    this.imc,
    this.data,
    this.resultadoImc,
    required this.nome,
    required this.peso,
    required this.altura,
  });

  static String calculoImc(double peso, double altura) {
    double imc = peso / (altura * altura);
    String resultado = "";
    if (imc < 18.6) {
      resultado = 'Abaixo do peso \nProcure um nutricionista você está abaixo do peso.';
    } else if (imc >= 18.6 && imc < 24.9) {
      resultado = 'Peso Ideal \nParabéns você  está no peso ideal.';
    } else if (imc >= 24.9 && imc < 29.9) {
      resultado = 'Levemente acima do peso \nPreste atenção você está sobrepeso.';
    } else if (imc >= 29.9 && imc < 34.9) {
      resultado = 'Obesidade grau I \nCuidado você está entrando em obesidade.';
    } else if (imc >= 34.9 && imc < 39.9) {
      resultado =
          'Obesidade grau II \nAtenção procure um nutricionista você está muito acima do peso.';
    } else if (imc >= 40.0) {
      resultado = 'Obesidade grau III \nUrgênte procure um nutricionista.';
    } else {
      resultado = "Peso ou Altura invalidos, tente novamente!";
    }

    imc = double.parse(imc.toStringAsFixed(2));
    return resultado;
  }
}
