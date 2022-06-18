import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

void main(List<String> arguments) {
  serve(
    (Request req) => Response(200,
        body: 'Olá Mundo', headers: {'content-type': 'application/json'}),
    'localhost',
    8080,
  );
}
