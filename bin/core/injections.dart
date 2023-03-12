import 'package:commons_core/commons_core.dart';

import '../application/web/categoria_controller.dart';
import '../application/web/estabelecimento_controller.dart';
import '../application/web/login_controller.dart';
import '../application/web/produto_controller.dart';
import '../application/web/user_controller.dart';
import '../application/web/venda_controller.dart';
import '../domain/ports/inputs/categoria_service.dart';
import '../domain/ports/inputs/estabelecimento_service.dart';
import '../domain/ports/inputs/login_service.dart';
import '../domain/ports/inputs/produto_service.dart';
import '../domain/ports/inputs/user_service.dart';
import '../domain/ports/inputs/vendas_service.dart';
import '../domain/ports/outputs/login_repository.dart';
import '../domain/ports/outputs/produto_repository.dart';
import '../domain/ports/outputs/categoria_repository.dart';
import '../domain/ports/outputs/estabelecimento_repository.dart';
import '../domain/ports/outputs/user_repository.dart';
import '../domain/ports/outputs/venda_repository.dart';
import '../domain/services/categoria_service_imp.dart';
import '../domain/services/estabelecimento_service_imp.dart';
import '../domain/services/login_service_imp.dart';
import '../domain/services/venda_service_imp.dart';
import '../domain/services/produto_service_imp.dart';
import '../domain/services/user_service_imp.dart';
import '../infrastructure/database/categoria_repository_imp.dart';
import '../infrastructure/database/estabelecimento_repository_imp.dart';
import '../infrastructure/database/login_repository_imp.dart';
import '../infrastructure/database/produto_repository_imp.dart';
import '../infrastructure/database/venda_repository_imp.dart';
import '../infrastructure/database/user_repository_imp.dart';
import '../infrastructure/mappers/categoria_mapper.dart';
import '../infrastructure/mappers/estabelecimento_mapper.dart';
import '../infrastructure/mappers/login_mapper.dart';
import '../infrastructure/mappers/produto_mapper.dart';
import '../infrastructure/mappers/user_mapper.dart';
import '../infrastructure/mappers/venda_mapper.dart';
import 'database/database.dart';
import 'database/database_mysql_adpter.dart';
import 'security/security_service.dart';
import 'security/security_service_imp.dart';

class Injections {
  static DependencyInjector init() {
    var di = DependencyInjector();

    di.register<Database>(() => DatabaseMySqlAdpter());
    di.register<SecurityService>(() => SecurityServiceImp());

    //login
    di.register<LoginRepository>(
        () => LoginRepositoryImp(di<Database>(), LoginMapper()));
    di.register<LoginService>(() => LoginServiceImp(di<LoginRepository>()));
    di.register<LoginController>(
        () => LoginController(di<LoginService>(), di<SecurityService>()));

    // user
    di.register<UserRepository>(
        () => UserRepositoryImp(di<Database>(), UserMapper()));
    di.register<UserService>(() => UserServiceImp(di<UserRepository>()));
    di.register<UserController>(() => UserController(di<UserService>()));

    // Estabelecimento
    di.register<EstabelecimentoRepository>(() =>
        EstabelecimentoRepositoryImp(di<Database>(), EstabelecimentoMapper()));
    di.register<EstabelecimentoService>(
        () => EstabelecimentoServiceImp(di<EstabelecimentoRepository>()));
    di.register<EstabelecimentoController>(
        () => EstabelecimentoController(di<EstabelecimentoService>()));

    // Categoria
    di.register<CategoriaRepository>(
        () => CategoriaRepositoryImp(di<Database>(), CategoriaMapper()));
    di.register<CategoriaService>(
        () => CategoriaServiceImp(di<CategoriaRepository>()));
    di.register<CategoriaController>(
        () => CategoriaController(di<CategoriaService>()));

    // Produto
    di.register<ProdutoRepository>(
        () => ProdutoRepositoryImp(di<Database>(), ProdutoMapper()));
    di.register<ProdutoService>(
        () => ProdutoServiceImp(di<ProdutoRepository>()));
    di.register<ProdutoController>(
        () => ProdutoController(di<ProdutoService>()));

    // Venda
    di.register<VendaRepository>(
        () => VendaRepositoryImp(di<Database>(), VendaMapper()));
    di.register<VendaService>(() => VendaServiceImp(di<VendaRepository>()));
    di.register<VendaController>(() => VendaController(di<VendaService>()));

    return di;
  }
}
