import 'user.dart';

class Event {
  String id;
  String type;
  Actor actor;
  Repo repo;
  Payload payload;
  bool public;
  String createdAt;

  Event(
      {this.id,
      this.type,
      this.actor,
      this.repo,
      this.payload,
      this.public,
      this.createdAt});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    actor = json['actor'] != null ? new Actor.fromJson(json['actor']) : null;
    repo = json['repo'] != null ? new Repo.fromJson(json['repo']) : null;
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    public = json['public'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.actor != null) {
      data['actor'] = this.actor.toJson();
    }
    if (this.repo != null) {
      data['repo'] = this.repo.toJson();
    }
    if (this.payload != null) {
      data['payload'] = this.payload.toJson();
    }
    data['public'] = this.public;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Actor {
  int id;
  String login;
  String displayLogin;
  String gravatarId;
  String url;
  String avatarUrl;

  Actor(
      {this.id,
      this.login,
      this.displayLogin,
      this.gravatarId,
      this.url,
      this.avatarUrl});

  Actor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    displayLogin = json['display_login'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['display_login'] = this.displayLogin;
    data['gravatar_id'] = this.gravatarId;
    data['url'] = this.url;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}

class Repo {
  int id;
  String name;
  String url;

  Repo({this.id, this.name, this.url});

  Repo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Payload {
  String action;

  Payload({this.action});

  Payload.fromJson(Map<String, dynamic> json) {
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    return data;
  }
}
