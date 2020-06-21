import 'package:http/http.dart' as http;

class Github {
  final String userName;
  final String url = 'https://api.gihub.com';
  static String client_id = "68db4450677p3044fa";
  static String client_secret = "90e9da8b0207bf3abdade5b04f25d4cb96bb2cb";
  static String token = "40ba846746a1990997d53b6dda38451ab8caeb";
  final String query = "?client_id=$client_id&client_secret=$client_secret";
  var client = http.Client();
  Github(this.userName);

  Future<http.Response> fetchUser() async {
    var response = await client.get(
      "https://api.github.com/users/$userName",
      headers: {
        "Accept": "application/vnd.github.v3+json",
        "Authorization": "token $token"
      },
    );
    return response;
  }

  Future<http.Response> fetchFollowing() {
    return client.get(
      url + "users/" + userName + "/following",
      headers: {
        "Accept": "application/vnd.github.v3+json",
        "Authorization": "token $token"
      },
    );
  }

  Future<http.Response> fetchEvents() {
    return client.get(
      "https://api.github.com/users/$userName/events",
      headers: {
        "Accept": "application/vnd.github.v3+json",
        "Authorization": "token $token"
      },
    );
  }

  Future<http.Response> fetChRepos() {
    return client.get(
      "https://api.github.com/users/$userName/repos",
      headers: {
        "Accept": "application/vnd.github.v3+json",
        "Authorization": "token $token"
      },
    );
  }

  Future<http.Response> fetChGists() {
    return client.get(
      "https://api.github.com/users/$userName/gists",
      headers: {
        "Accept": "application/vnd.github.v3+json",
        "Authorization": "token $token"
      },
    );
  }
}
