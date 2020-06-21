import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubtracker/models/event.dart';
import 'package:githubtracker/models/gist.dart';
import 'package:githubtracker/models/user.dart';
import 'package:githubtracker/providers/events_provider.dart';
import 'package:githubtracker/providers/follower_provider.dart';
import 'package:githubtracker/providers/gist_provider.dart';
import 'package:githubtracker/widgets/event_card_item.dart';
import 'package:provider/provider.dart';

class FollowerPage extends StatefulWidget {
  final String username;

  const FollowerPage({Key key, this.username}) : super(key: key);

  @override
  _FollowerPageState createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage> {
  FollowerProvider followerData;
  List<User> _listFollower;

  @override
  Widget build(BuildContext context) {
    followerData = Provider.of<FollowerProvider>(context);
    return FutureBuilder<List<User>>(
        future: followerData.fetchUsers(widget.username),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: Text("loading ..."),
            );
          _listFollower = snapshot.data;
          return ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text(_listFollower[index].login),
            );
          });
        });
  }
}
