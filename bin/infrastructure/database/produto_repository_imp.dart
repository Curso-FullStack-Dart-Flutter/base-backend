import '../../core/database/database.dart';
import '../../core/database/mapper.dart';
import '../../domain/models/produto.dart';
import '../../domain/ports/outputs/produto_repository.dart';

class ProdutoRepositoryImp implements ProdutoRepository {
  final Database _database;
  final Mapper _mapper;
  ProdutoRepositoryImp(this._database, this._mapper);

  @override
  Future<List<Produto>> getProdutos() async {
    final String _sql = '''
      SELECT 
        p.nome as produtoNome,
        p.descricao as produtoDescricao,
        p.valor as produtoValor,
        p.status as produtoStatus,
        c.nome as categoriaNome,
        c.descricao as categoriaDescricao,
        e.nome as estabelecimentoNome,
        e.cnpj as estabelecimentoCnpj,
        e.telefone as estabelecimentoTelefone,
        e.descricao as estabelecimentoDescricao,
        e.imagemUrl as estabelecimentoImg,
        e.latitude as estabelecimentoLatitude,
        e.longitude as estabelecimentoLongitude,
        e.endereco as estabeleciementoEndereco,
        e.enderecoNumero as estabelecimentoNumero,
        e.enderecoOpcional as estabelecimentoEnderecoOpcional,
        e.status as estabelecimentoStatus,
        u.nome as usuarioNome,
        u.sobrenome as usuarioSobrenome,
        u.dataNasc as usuarioDtNasc,
        u.status as usuarioStatus,
        u.documento as usuarioDocumento,
        u.email as usuarioEmail,
        u.cidade as usuarioCidade
      FROM tb_produtos p
      INNER JOIN tb_categorias c ON c.id = p.idCategoria
      INNER JOIN tb_estabelecimentos e ON e.id = p.idEstabelecimento
      INNER JOIN tb_usuarios u ON u.id = e.idUsuario;
    ''';
    var queryResult = await _database.query(_sql);

    return queryResult
        .map((row) => _mapper.toDomain(row.fields))
        .toList()
        .cast<Produto>();
  }
}
