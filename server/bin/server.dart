import 'dart:io';
import 'dart:async';

import 'package:ShadowHunters_Server/ServerLibrary.dart';

void runServer(String basePath, int port) {

  GameHandler gameHandler = new GameHandler();

  defaultRequestHandler(HttpRequest request) {
    String path = request.uri.path == '/' ? '/index.html' : request.uri.path;
    File file = new File('${basePath}${path}');
    file.exists().then((bool found) {
      if (found) {
        file.openRead().pipe(request.response);
      } else {
        request.response.statusCode = HttpStatus.NOT_FOUND;
        request.response.close();
      }
    });
  }

  HttpServer.bind("0.0.0.0", port).then((HttpServer server) {
    print("Server is running —> http://localhost:${port}");
    var sc = new StreamController();
    sc.stream.transform(new WebSocketTransformer()).listen(
        gameHandler.onConnection
    );

    server.listen((HttpRequest request) {
      if(request.uri.path == "/ws") {
        // Redirecting request to websocket handler
        sc.add(request);
      } else {
        defaultRequestHandler(request);
      }
    });
  });
}

void main() {
  // Running the server
  runServer("../../client/web", 4000);
}