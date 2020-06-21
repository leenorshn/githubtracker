import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:githubtracker/models/gist.dart';
import 'package:githubtracker/models/user.dart';

import '../github_service.dart';

class FollowerProvider with ChangeNotifier {
  List<User> follower;

  Future<List<User>> fetchUsers(username) async {
    final response = await Github(username).fetchFollowing();

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print("*********** " + jsonResponse[0]);
      List<User> users = jsonResponse
          .map((model) => User.fromJson(model as Map<String, dynamic>))
          .toList();

      return users;
    }
  }
}
