// /estabelecimento
import '../../domain/port/intput/estabelecimento_service.dart';

class EstabelecimentoController {
  // www.meusite.com/estabelecimento/getAll

  final EstabelecimentoService _estabelecimentoService;
  EstabelecimentoController(this._estabelecimentoService);

  // /getAll
  void getAll() {
    _estabelecimentoService.getListEstabelecimentos().forEach(print);
  }
}
