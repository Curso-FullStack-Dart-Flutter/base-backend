import '../../core/database/database.dart';
import '../../core/database/mapper.dart';
import '../../domain/models/estabelecimento.dart';
import '../../domain/ports/outputs/estabelecimento_repository.dart';

class EstabelecimentoRepositoryImp implements EstabelecimentoRepository {
  final Database _database;
  final Mapper _mapper;
  EstabelecimentoRepositoryImp(this._database, this._mapper);

  @override
  Estabelecimento getEstabelecimentoByCnpj(String cnpj) {
    // TODO: implement getEstabelecimentoByCnpj
    throw UnimplementedError();
  }

  @override
  Estabelecimento getEstabelecimentoById(int id) {
    // TODO: implement getEstabelecimentoById
    throw UnimplementedError();
  }

  @override
  Future<List<Estabelecimento>> getEstabelecimentos() async {
    final String _sql = '''
      SELECT
        e.id as idEstabelecimento,
          e.nome as nomeEstabelecimento,
          e.cnpj,
          e.telefone,
          e.descricao, 
          e.imagemUrl,
          e.latitude,
          e.longitude,
          e.endereco,
          e.enderecoNumero,
          e.enderecoOpcional,
          e.status as statusEstabelecimento,
          u.id as idUsuario,
          u.nome as usuarioNome,
          u.sobrenome,
          u.dataNasc,
          u.documento,
          u.email,
          u.cidade,
          u.status as statusUsuario
      FROM tb_estabelecimentos e
      INNER JOIN tb_usuarios u on u.id = e.idUsuario
    ''';
    var result = await _database.query(_sql);
    List<Estabelecimento> estabelecimentos = result
        .map((row) => _mapper.toDomain(row.fields))
        .toList()
        .cast<Estabelecimento>();
    return estabelecimentos;
  }

  @override
  Future<bool> saveEstabelecimento(Estabelecimento estabelecimento) {
    // TODO: implement saveEstabelecimento
    throw UnimplementedError();
  }
}
