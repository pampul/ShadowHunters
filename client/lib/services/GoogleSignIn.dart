part of client_library;

@Injectable()
class GoogleSignInService {

  final auth = new GoogleOAuth2(
    "227440942862-g6auj4rmi0kbbn6arpina7ofjukn4qn4.apps.googleusercontent.com",
    ["openid", "email"],
    autoLogin: true);

  bool isAuthenticated = false;
}
