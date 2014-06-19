part of client_library;

void mainRouterInitializer(Router router, RouteViewFactory views) {

  views.configure({
    'main': ngRoute(path: '', view: 'partials/sign_in.html'),
    'game': ngRoute(path: '/game', view: 'partials/game.html')
  });

}