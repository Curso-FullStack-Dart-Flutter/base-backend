import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:mysql1/mysql1.dart';

import 'package:commons_core/commons_core.dart';

import 'core/database/database_mysql_adpter.dart';

void main(List<String> arguments) async {
  await DatabaseMySqlAdpter()
      .query("insert into tb_permissoes(nome, status) values ('ADMIN', 'A')");
  print(await DatabaseMySqlAdpter().query('select * from tb_permissoes'));

  // await serve(
  //   (Request req) => Response(200,
  //       body: 'Olá Mundo', headers: {'content-type': 'application/json'}),
  //   'localhost',
  //   8080,
  // );
}
