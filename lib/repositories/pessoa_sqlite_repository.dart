import 'package:calculadoraimc/model/pessoa_sqlite_model.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
      'imc': pessoa.peso / (pessoa.altura * pessoa.altura),
      'resultadoImc': PessoaSqliteModel.calculoImc(pessoa.peso, pessoa.altura),
    };
    await db.insert(_tableName, pessoaData);
  }

  Future<List<PessoaSqliteModel>> obterTodasPessoas() async {
    final Database db = await _initializeDatabase();
    final List<Map<String, dynamic>> results = await db.query(_tableName);
    return results
        .map(
          (e) => PessoaSqliteModel(
            nome: e['nome'],
            peso: e['peso'],
            altura: e['altura'],
            data: e['data'],
            imc: e['imc'],
            resultadoImc: e['resultadoImc'],
            id: e['id'],
          ),
        )
        .toList();
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
