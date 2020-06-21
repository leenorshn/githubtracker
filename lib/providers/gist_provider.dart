import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:githubtracker/models/gist.dart';

import '../github_service.dart';

class GistProvider with ChangeNotifier {
  List<Gist> gist;

  Future<List<Gist>> fetchGists(username) async {
    final response = await Github(username).fetChGists();

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print("========= " + jsonResponse[0]);
      List<Gist> gist = jsonResponse
          .map((model) => Gist.fromJson(model as Map<String, dynamic>))
          .toList();

      return gist;
    }
  }
}
