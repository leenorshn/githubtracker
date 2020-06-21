import 'package:flutter/material.dart';
import 'package:githubtracker/models/gist.dart';
import 'package:githubtracker/providers/events_provider.dart';
import 'package:githubtracker/providers/follower_provider.dart';
import 'package:githubtracker/providers/gist_provider.dart';
import 'package:githubtracker/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'github_service.dart';
import 'screens/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<GistProvider>(
          create: (context) => GistProvider(),
        ),
        ChangeNotifierProvider<FollowerProvider>(
          create: (context) => FollowerProvider(),
        ),
        ChangeNotifierProvider<EventsProvider>(
          create: (context) => EventsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Github Tracker',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
      ),
    );
  }
}
