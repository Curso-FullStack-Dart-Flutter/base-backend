import '../../models/categoria.dart';

abstract class CategoriaRepository {
  Future<List<Categoria>> getCategorias();
}
