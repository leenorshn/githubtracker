import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubtracker/models/event.dart';
import 'package:githubtracker/models/gist.dart';
import 'package:githubtracker/providers/events_provider.dart';
import 'package:githubtracker/providers/gist_provider.dart';
import 'package:githubtracker/widgets/event_card_item.dart';
import 'package:provider/provider.dart';

class ReposPage extends StatefulWidget {
  final String username;

  const ReposPage({Key key, this.username}) : super(key: key);

  @override
  _ReposPageState createState() => _ReposPageState();
}

class _ReposPageState extends State<ReposPage> {
  EventsProvider eventsProvider;
  List<Event> _listEvents;

  @override
  Widget build(BuildContext context) {
    eventsProvider = Provider.of<EventsProvider>(context);
    return FutureBuilder<List<Event>>(
        future: eventsProvider.fetchActivities(widget.username),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: Text("loading ..."),
            );
          _listEvents = snapshot.data;
          return ListView.builder(itemBuilder: (context, index) {
            return EventCardItem(
              event: _listEvents[index],
            );
          });
        });
    /*return Container(
      color: Colors.blueGrey[50],
      child: ListView.builder(
        itemCount: _listEvents.length,
        itemBuilder: (context, index) {

        },
      ),
    );*/
  }
}
