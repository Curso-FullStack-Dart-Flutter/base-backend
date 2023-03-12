import '../models/categoria.dart';
import '../ports/inputs/categoria_service.dart';
import '../ports/outputs/categoria_repository.dart';

class CategoriaServiceImp implements CategoriaService {
  final CategoriaRepository _categoriaRepository;
  CategoriaServiceImp(this._categoriaRepository);

  @override
  Future<List<Categoria>> getAllCategorias() =>
      _categoriaRepository.getCategorias();
}
