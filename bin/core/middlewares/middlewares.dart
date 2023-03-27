import 'package:shelf/shelf.dart';

class Middlewares {
  static Middleware get cors {
    var _headers = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Headers':
          'Origin, X-Requested-With, Content-Type, Accept'
    };

    return createMiddleware(
      requestHandler: (req) {
        if (req.method == 'OPTIONS') return Response(200, headers: _headers);
        return null;
      },
      responseHandler: (res) => res.change(headers: _headers),
    );
  }
}
