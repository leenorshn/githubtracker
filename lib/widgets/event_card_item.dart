import 'package:flutter/material.dart';
import 'package:githubtracker/models/event.dart';

class EventCardItem extends StatelessWidget {
  final Event event;

  const EventCardItem({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.3,
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Container(
        height: 80,
        child: ListTile(
            title: Text(
              event.repo.name,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              event.repo.url,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: Icon(
                event.public ? Icons.satellite : Icons.lock,
                color: event.public ? Colors.blue : Colors.amber,
              ),
            )),
      ),
    );
  }
}
