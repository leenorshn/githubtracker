import 'package:flutter/material.dart';
import 'package:githubtracker/models/user.dart';
import 'package:githubtracker/providers/user_provider.dart';
import 'package:githubtracker/screens/pages/overview_page.dart';
import 'package:provider/provider.dart';

import 'pages/follower_page.dart';
import 'pages/repository_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).getUser();
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * .35,
              floating: false,
              pinned: true,
              bottom: TabBar(controller: _tabController, tabs: [
                Tab(
                  text: "Overview",
                ),
                Tab(
                  text: "Repositories",
                ),
                Tab(
                  text: "Followers",
                )
              ]),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  " ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 56,
                        backgroundImage: NetworkImage(user.avatarUrl),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "@${user.login}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            OverviewPage(
              username: user.login,
            ),
            ReposPage(
              username: user.login,
            ),
            FollowerPage(
              username: user.login,
            )
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
