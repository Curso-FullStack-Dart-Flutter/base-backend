import '../../models/categoria.dart';

abstract class CategoriaService {
  Future<List<Categoria>> getAllCategorias();
}
