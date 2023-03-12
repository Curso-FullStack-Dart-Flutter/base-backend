import '../../models/estabelecimento.dart';

abstract class EstabelecimentoRepository {
  Future<List<Estabelecimento>> getEstabelecimentos();
  Future<bool> saveEstabelecimento(Estabelecimento estabelecimento);
  Estabelecimento getEstabelecimentoById(int id);
  Estabelecimento getEstabelecimentoByCnpj(String cnpj);
}
