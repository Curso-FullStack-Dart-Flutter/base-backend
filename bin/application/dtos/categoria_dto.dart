import '../../domain/models/categoria.dart';

class CategoriaDto extends Categoria {
  CategoriaDto(super.nome, super.descricao);

  static Map toMap(Categoria categoria) => {
        'nome': categoria.nome,
        'descricao': categoria.descricao,
      };
}
