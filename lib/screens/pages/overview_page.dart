import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubtracker/models/event.dart';
import 'package:githubtracker/models/gist.dart';
import 'package:githubtracker/providers/events_provider.dart';
import 'package:githubtracker/providers/gist_provider.dart';
import 'package:githubtracker/widgets/event_card_item.dart';
import 'package:provider/provider.dart';

class OverviewPage extends StatefulWidget {
  final String username;

  const OverviewPage({Key key, this.username}) : super(key: key);

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  GistProvider gistData;
  List<Gist> _listEvents;

  @override
  Widget build(BuildContext context) {
    gistData = Provider.of<GistProvider>(context);
    return FutureBuilder<List<Gist>>(
        future: gistData.fetchGists(widget.username),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: Text("loading ..."),
            );
          _listEvents = snapshot.data;
          return ListView.builder(itemBuilder: (context, index) {
            return Text("${_listEvents[index].owner.login}");
          });
        });
    /*return Container(
      color: Colors.blueGrey[50],
      child: ListView.builder(
        itemCount: _listEvents.length,
        itemBuilder: (context, index) {
          return EventCardItem(
            event: _listEvents[index],
          );
        },
      ),
    );*/
  }
}
