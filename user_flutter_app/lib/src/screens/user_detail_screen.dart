import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class UserDetailScreen extends StatefulWidget {
  static const routeName = '/user-detail-screen';

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final userId = ModalRoute.of(context).settings.arguments as String;
    var currentIndex = double.parse(userId);
    final selectedUser =
        Provider.of<UserProvider>(context, listen: false).findUserById(userId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedUser.firstName + ' ' + selectedUser.lastName),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300.0,
                child: GridTile(
                  child: Container(
                    color: Theme.of(context).accentColor,
                    child: InteractiveViewer(
                      child: Image.network(
                        selectedUser.avatar,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        selectedUser.email,
                        style: new TextStyle(
                          fontSize: 14.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.navigate_before),
                          onPressed: () {
                            setState(() {
                              currentIndex++;
                            });
                          },
                        ),
                        Text(currentIndex.toString()),
                        IconButton(
                            icon: Icon(Icons.navigate_next), onPressed: null),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
