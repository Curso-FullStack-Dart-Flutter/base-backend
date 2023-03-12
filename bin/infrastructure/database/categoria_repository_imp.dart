import '../../core/database/database.dart';
import '../../core/database/mapper.dart';
import '../../domain/models/categoria.dart';
import '../../domain/ports/outputs/categoria_repository.dart';

class CategoriaRepositoryImp implements CategoriaRepository {
  final Database _database;
  final Mapper _mapper;
  CategoriaRepositoryImp(this._database, this._mapper);

  @override
  Future<List<Categoria>> getCategorias() async {
    final String _sql = "SELECT nome, descricao FROM tb_categorias;";
    var queryResult = await _database.query(_sql);

    return queryResult
        .map((row) => _mapper.toDomain(row.fields))
        .toList()
        .cast<Categoria>();
  }
}
