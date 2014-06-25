library client_library;
import 'dart:html';
import 'dart:async';
import 'dart:convert' show JSON;
import 'dart:math' as Math;
import 'package:logging/logging.dart';
import 'package:angular/angular.dart';
import 'package:google_oauth2_client/google_oauth2_browser.dart';


part 'src/Connection.dart';
part 'src/Gui.dart';
part 'models/Game.dart';
part 'models/Player.dart';
part 'controllers/MainController.dart';
part 'controllers/SignInController.dart';
part 'routing/Router.dart';
part 'services/GoogleSignIn.dart';
part 'services/WebSocketClientService.dart';