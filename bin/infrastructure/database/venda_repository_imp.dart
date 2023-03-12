import '../../core/database/database.dart';
import '../../core/database/mapper.dart';
import '../../domain/models/venda.dart';
import '../../domain/ports/outputs/venda_repository.dart';

class VendaRepositoryImp implements VendaRepository {
  final Database _database;
  final Mapper _mapper;
  VendaRepositoryImp(this._database, this._mapper);

  @override
  Future<List<Venda>> getVendas() async {
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
        u.cidade as usuarioCidade,
        us.nome as compradorNome,
        us.sobrenome as compradorSobrenome,
        us.dataNasc as compradorDtNasc,
        us.status as compradorStatus,
        us.documento as compradorDocumento,
        us.email as compradorEmail,
        us.cidade as compradorCidade,
        v.status as vendaStatus,
        v.dtCreated as vendaData
      FROM tb_vendas v
      INNER JOIN tb_produtos p on p.id = v.idProduto
      INNER JOIN tb_categorias c ON c.id = p.idCategoria
      INNER JOIN tb_estabelecimentos e ON e.id = p.idEstabelecimento  
      INNER JOIN tb_usuarios u ON u.id = e.idUsuario
      INNER JOIN tb_usuarios us on us.id = v.idUsuario
    ''';
    var queryResult = await _database.query(_sql);

    return queryResult
        .map((row) => _mapper.toDomain(row.fields))
        .toList()
        .cast<Venda>();
  }
}
