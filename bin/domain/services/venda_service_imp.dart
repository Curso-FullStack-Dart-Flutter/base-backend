import '../models/venda.dart';
import '../ports/inputs/vendas_service.dart';
import '../ports/outputs/venda_repository.dart';

class VendaServiceImp implements VendaService {
  final VendaRepository _vendaRepository;
  VendaServiceImp(this._vendaRepository);

  @override
  Future<List<Venda>> getAllVendas() => _vendaRepository.getVendas();
}
