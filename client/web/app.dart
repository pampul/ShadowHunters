import 'dart:html';
import 'package:ShadowHunters_Client/ClientLibrary.dart';
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';


class AppModule extends Module {
  AppModule() {
    type(GoogleSignInService);
    type(WebSocketClientService);
    type(GameController);
    type(MainController);
    type(SignInController);
    value(RouteInitializerFn, mainRouterInitializer);
    type(Player);
    factory(NgRoutingUsePushState,
        (_) => new NgRoutingUsePushState.value(false));
  }
}

void main() {
  applicationFactory()
  .addModule(new AppModule())
  .run();
}