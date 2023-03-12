import '../models/estabelecimento.dart';
import '../ports/inputs/estabelecimento_service.dart';
import '../ports/outputs/estabelecimento_repository.dart';

class EstabelecimentoServiceImp implements EstabelecimentoService {
  final EstabelecimentoRepository _estabelecimentoRepository;
  EstabelecimentoServiceImp(this._estabelecimentoRepository);

  @override
  Future<List<Estabelecimento>> getAllEstabelecimentos() {
    return _estabelecimentoRepository.getEstabelecimentos();
  }

  @override
  Future<bool> saveEstabelecimento(Estabelecimento estabelecimento) {
    return _estabelecimentoRepository.saveEstabelecimento(estabelecimento);
  }
}
