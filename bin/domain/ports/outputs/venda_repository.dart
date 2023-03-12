import '../../models/venda.dart';

abstract class VendaRepository {
  Future<List<Venda>> getVendas();
}
