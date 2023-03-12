import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'package:commons_core/commons_core.dart';

import 'application/web/categoria_controller.dart';
import 'application/web/estabelecimento_controller.dart';
import 'application/web/produto_controller.dart';
import 'application/web/user_controller.dart';
import 'application/web/venda_controller.dart';
import 'core/injections.dart';

void main(List<String> arguments) async {
  final i = Injections.init();

  var cascadeHandler = Cascade()
      .add(i<UserController>().getHandler())
      .add(i<EstabelecimentoController>().getHandler())
      .add(i<CategoriaController>().getHandler())
      .add(i<ProdutoController>().getHandler())
      .add(i<VendaController>().getHandler())
      .handler;

  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  shelf_io
      .serve(
        handler,
        await CustomEnv.get<String>(key: 'server_ip'),
        await CustomEnv.get<int>(key: 'server_port'),
      )
      .then(
        (s) => print(
            'Servidor inicializado http://${s.address.address}:${s.port}'),
      );
}
