import 'package:shared_preferences/shared_preferences.dart';

enum StorageChaves {
  chaveDadosCadastraisNome,
  chaveNomeUsuario,
  chaveAltura,
  chaveReceberNotificacoes,
  chaveTemaEscuro,
}

class AppStorageService {
  Future<void> setConfiguracoesTemaEscuro(bool value) async {
    await _setBool(StorageChaves.chaveTemaEscuro.toString(), value);
  }

  Future<bool> getConfiguracoesTemaEscuro() async {
    return _getBool(StorageChaves.chaveTemaEscuro.toString());
  }

  Future<void> setConfiguracoesReceberNotificacao(bool value) async {
    await _setBool(StorageChaves.chaveReceberNotificacoes.toString(), value);
  }

  Future<bool> getConfiguracoesReceberNotificacao() async {
    return _getBool(StorageChaves.chaveReceberNotificacoes.toString());
  }

  Future<void> setConfiguracoesAltura(double value) async {
    await _setDouble(StorageChaves.chaveAltura.toString(), value);
  }

  Future<double> getConfiguracoesAltura() async {
    return _getDouble(StorageChaves.chaveAltura.toString());
  }

  Future<void> setConfiguracoesNomeUsuario(String nome) async {
    await _setString(StorageChaves.chaveNomeUsuario.toString(), nome);
  }

  Future<String> getConfiguracoesNomeUsuario() async {
    return _getString(StorageChaves.chaveNomeUsuario.toString());
  }

  Future<void> setDadosCadastraisNome(String nome) async {
    await _setString(StorageChaves.chaveDadosCadastraisNome.toString(), nome);
  }

  Future<String> getDadosCadastraisNome() async {
    return _getString(StorageChaves.chaveDadosCadastraisNome.toString());
  }

  Future<void> _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }

  Future<void> _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  Future<void> _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(chave, value);
  }

  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }
}
