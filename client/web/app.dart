import 'dart:html';
import 'package:ShadowHunters_Client/ClientLibrary.dart';
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';


class MyAppModule extends Module {
  MyAppModule() {
    type(GoogleSignInService);
    type(WebSocketClientService);
    type(MainController);
    type(SignInController);
    value(RouteInitializerFn, mainRouterInitializer);
    factory(NgRoutingUsePushState,
        (_) => new NgRoutingUsePushState.value(false));
  }
}

void main() {
  applicationFactory()
  .addModule(new MyAppModule())
  .run();

  /*
  Connection conn = new Connection("ws://" + window.location.host + "/ws");

  conn.send({"cmd":"getMessage", "arg": "Oui oui"});
  */
}