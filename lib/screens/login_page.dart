import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubtracker/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();

  void _getUser() {
    if (_usernameController.text == '') {
      Provider.of<UserProvider>(context)
          .setMessage("please enter your username");
    } else {
      Provider.of<UserProvider>(context, listen: false)
          .fetchUser(_usernameController.text)
          .then((value) {
        if (value) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => HomePage()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 64,
                    ),
                    CircleAvatar(
                      radius: 56,
                      backgroundImage: AssetImage("images/logo.jpg"),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Github tracker",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _usernameController,
                    onChanged: (value) {
                      Provider.of<UserProvider>(context).setMessage(null);
                    },
                    enabled: !Provider.of<UserProvider>(context).isLoading(),
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        errorText:
                            Provider.of<UserProvider>(context).getMessage(),
                        border: InputBorder.none,
                        hintText: "Github Username",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: _getUser,
                  child: Provider.of<UserProvider>(context).isLoading()
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        )
                      : Text(
                          "Tracker your activity",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
