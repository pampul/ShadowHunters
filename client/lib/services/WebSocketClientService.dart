part of client_library;

@Injectable()
class WebSocketClientService {

  WebSocket _ws;

  String get url {
    String url = window.location.origin;
    if (url.startsWith('https')) {
      url = url.replaceFirst('https', 'wss');
    } else {
      url = url.replaceFirst('http', 'ws');
    }
    if (url.contains('cfapps.io')) {
      url = "$url:4443";
    }
    return '$url/ws';
  }

  WebSocketClientService() {
    _ws = new WebSocket(url);
  }

  objectToJson(object){
    return (object == null) ? {
    } : (object is String || object is int) ? object : object.toJson();
  }

  void sendJsonMessage(String sendDestination, var object) {
    Map message = {"cmd": sendDestination, "arg": object};

    _ws.send(JSON.encode(message));
  }

  Future jsonMessageRequest(String sendDestination, var object, String subscribeDestination) {
    var c = new Completer();

    jsonSubscribe(subscribeDestination).then((_){
      c.complete(_);
    });
    sendJsonMessage(sendDestination, object);

    return c.future;

  }

  Future jsonSubscribe(String subscribeDestination) {
    var c = new Completer();

    _ws.onMessage.listen((e) {
      // Client receives a message from server
      Map dataFromServer = JSON.decode(e.data);
      // Choosing an action accordingly to command sent by server
      if (subscribeDestination == dataFromServer["cmd"]) {
        c.complete(dataFromServer["arg"]);
      }
    });

    return c.future;

  }

  void disconnect(){
    _ws.close();
  }

}
