import '../../core/database/mapper.dart';
import '../../domain/models/user.dart';
import '../../domain/models/venda.dart';
import 'produto_mapper.dart';

class VendaMapper implements Mapper<Venda> {
  @override
  Venda toDomain(Map map) => Venda(
        map['vendaStatus'],
        map['vendaData'],
        User(
          map['compradorNome'],
          map['compradorSobrenome'],
          map['compradorDtNasc'],
          map['compradorStatus'],
          map['compradorDocumento'],
          map['compradorEmail'],
          map['compradorCidade'],
        ),
        ProdutoMapper().toDomain(map),
      );
}
