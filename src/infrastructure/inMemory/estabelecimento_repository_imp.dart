import '../../domain/model/estabelecimento.dart';
import '../../domain/port/output/estabelecimento_repository.dart';
import 'estabelecimento_mapper.dart';

class EstabelecimentoRepositoryImp implements EstabelecimentoRepository {
  final EstabelecimentoMapper _estabelecimentoMapper;
  EstabelecimentoRepositoryImp(this._estabelecimentoMapper);

  List<Map> fakeDB = [
    {
      'nome': 'Estabelecimento XPTO',
      'cnpj': '12345678912345',
    },
    {
      'nome': 'Estabelecimento DOIS',
      'cnpj': '12345678912345',
    }
  ];

  @override
  List<Estabelecimento> getListEstabelecimentos() {
    return fakeDB.map((e) => _estabelecimentoMapper.toDomain(e)).toList();
  }
}
