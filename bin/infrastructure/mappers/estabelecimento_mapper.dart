import '../../core/database/mapper.dart';
import '../../domain/models/estabelecimento.dart';
import '../../domain/models/user.dart';

class EstabelecimentoMapper implements Mapper<Estabelecimento> {
  @override
  Estabelecimento toDomain(Map map) => Estabelecimento(
        map['nomeEstabelecimento'],
        map['cnpj'],
        map['telefone'],
        map['descricao'],
        map['imagemUrl'],
        map['latitude'],
        map['longitude'],
        map['endereco'],
        map['enderecoNumero'],
        map['enderecoOpcional'],
        map['statusEstabelecimento'],
        User(
          map['usuarioNome'],
          map['sobrenome'],
          map['dataNasc'],
          map['statusUsuario'],
          map['documento'],
          map['email'],
          map['cidade'],
        ),
      );
}
