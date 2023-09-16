import '../model/calcular_imc.dart';

class ImcRepository {
  final List<Pessoa> _pessoa = [];

  Future<void> adicionar(Pessoa pessoa) async {
    await Future.delayed(const Duration(milliseconds: 200));
  }

  Future<void> alterar(int id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _pessoa.where((pessoa) => pessoa.id == id).first;
  }

  Future<void> remove(int id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _pessoa.where((pessoa) => pessoa.id == id).first;
  }

  Future<List<Pessoa>> listarPessoa() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _pessoa;
  }
}
