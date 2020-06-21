import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:githubtracker/github_service.dart';
import 'package:githubtracker/models/user.dart';

class UserProvider with ChangeNotifier {
  User user;
  String errorMessage;
  bool loading = false;

  Future<bool> fetchUser(username) async {
    setLoading(true);
    await Github(username).fetchUser().then((value) {
      setLoading(false);
      if (value.statusCode == 200) {
        setUser(User.fromJson(json.decode(value.body)));
      } else {
        Map<String, dynamic> result = json.decode(value.body);
        setMessage(result['message']);
      }
    });

    return isUser();
  }

  User getUser() {
    return user;
  }

  String getMessage() {
    print(errorMessage);
    return errorMessage;
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void setUser(value) {
    user = value;
    notifyListeners();
  }

  bool isUser() {
    return user != null ? true : false;
  }
}
