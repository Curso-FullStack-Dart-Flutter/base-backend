import '../../core/database/mapper.dart';
import '../../domain/models/categoria.dart';

class CategoriaMapper implements Mapper<Categoria> {
  @override
  Categoria toDomain(Map map) => Categoria(map['nome'], map['descricao']);
}
