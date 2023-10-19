/*/import 'package:calculadoraimc/model/pessoa_sqlite_model.dart';
import 'package:calculadoraimc/db_helper/sqlitedatabase.dart';

class PessoaSqliteRepository {
  Future<List<PessoaSqliteModel>> obterDados() async {
    List<PessoaSqliteModel> Pessoas = [];
    var db = await SqliteDatabase().obterDataBase();
    var result = await db.rawQuery(
        'SELECT id, nome, data, altura, peso, imc, resultadoImc FROM pessoas');
    for (var element in result) {
      PessoaSqliteModel pessoa = PessoaSqliteModel(
          int.parse(element["id"].toString()),
          element["nome"].toString(),
          double.parse(element["peso"].toString()),
          double.parse(element["altura"].toString()));
      Pessoas.add(pessoa);
    }
    return Pessoas;
  }

  Future<void> salvar(PessoaSqliteModel pessoaSqliteModel) async {
    if (pessoaSqliteModel.id > 0) {
      atualizar(pessoaSqliteModel);
    } else {
      var db = await SqliteDatabase().obterDataBase();
      pessoaSqliteModel.calculoImc(
          pessoaSqliteModel.peso, pessoaSqliteModel.altura);
      await db.rawInsert(
          'INSERT INTO pessoas (nome, data, peso, altura, imc, resultadoImc) values(?,?,?,?,?,?)',
          [
            pessoaSqliteModel.nome,
            pessoaSqliteModel.data,
            pessoaSqliteModel.peso,
            pessoaSqliteModel.altura,
            pessoaSqliteModel.imc,
            pessoaSqliteModel.resultadoImc
          ]);
    }
  }

  Future<void> atualizar(PessoaSqliteModel pessoaSqliteModel) async {
    var db = await SqliteDatabase().obterDataBase();
    pessoaSqliteModel.calculoImc(
        pessoaSqliteModel.peso, pessoaSqliteModel.altura);
    await db.rawUpdate(
        'UPDATE pessoas SET nome = ?, data = ?, altura = ?, peso = ?, imc = ?, resultadoImc = ? WHERE id = ?',
        [
          pessoaSqliteModel.nome,
          pessoaSqliteModel.data,
          pessoaSqliteModel.peso,
          pessoaSqliteModel.altura,
          pessoaSqliteModel.imc,
          pessoaSqliteModel.resultadoImc,
          pessoaSqliteModel.id
        ]);
  }

  Future<void> remove(int id) async {
    var db = await SqliteDatabase().obterDataBase();
    await db.rawDelete('DELETE FROM pessoas WHERE id = ?', [id]);
  }
}*/

import 'package:calculadoraimc/model/pessoa_sqlite_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

class PessoaSqliteRepository {
  final String _databaseName = 'seu_banco_de_dados.db';
  final String _tableName = 'pessoas';

  Future<Database> _initializeDatabase() async {
    final String path = join(await getDatabasesPath(), _databaseName);
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE $_tableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT,
          peso REAL,
          altura REAL,
          data TEXT,
          imc REAL,
          resultadoImc TEXT
        )
      ''');
    });
  }

  Future<void> salvarPessoa(PessoaSqliteModel pessoa) async {
    final Database db = await _initializeDatabase();
    final Map<String, dynamic> pessoaData = {
      'nome': pessoa.nome,
      'peso': pessoa.peso,
      'altura': pessoa.altura,
      'data': DateFormat('dd/MM/yy').format(DateTime.now()),
      'imc': pessoa.imc,
      'resultadoImc': pessoa.resultadoImc,
    };
    await db.insert(_tableName, pessoaData);
  }

  Future<List<PessoaSqliteModel>> obterTodasPessoas() async {
    final Database db = await _initializeDatabase();
    final List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((map) {
      return PessoaSqliteModel(
          map['nome'], map['peso'], map['altura'], map['resultadoImc']);
    }).toList();
  }

  Future<void> atualizarPessoa(PessoaSqliteModel pessoa) async {
    final Database db = await _initializeDatabase();
    final Map<String, dynamic> pessoaData = {
      'nome': pessoa.nome,
      'peso': pessoa.peso,
      'altura': pessoa.altura,
      'imc': pessoa.imc,
      'resultadoImc': pessoa.resultadoImc,
    };
    await db.update(
      _tableName,
      pessoaData,
      where: 'id = ?',
      whereArgs: [pessoa.id],
    );
  }

  Future<void> removerPessoa(int id) async {
    final Database db = await _initializeDatabase();
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
