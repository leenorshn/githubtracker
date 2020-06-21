import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:githubtracker/models/event.dart';

import '../github_service.dart';

class EventsProvider with ChangeNotifier {
  List<Event> events;

  Future<List<Event>> fetchActivities(username) async {
    final response = await Github(username).fetchEvents();

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(jsonResponse[0]['id']);
      List<Event> ev = jsonResponse
          .map((model) => Event.fromJson(model as Map<String, dynamic>))
          .toList();
      setListEvent(ev);
      return ev;
    }
  }

  setListEvent(List<Event> data) {
    events = data;
    notifyListeners();
  }
}
