import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../providers/user_provider.dart';

class UserDetailScreen extends StatelessWidget {
  final TransformationController _transformationController =
      TransformationController();
  static const routeName = '/user-detail-screen';
  @override
  Widget build(BuildContext context) {
    final usersList = Provider.of<UserProvider>(context).usersList;
    final userId = ModalRoute.of(context).settings.arguments;
    final selectedUser =
        Provider.of<UserProvider>(context, listen: false).findUserById(userId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedUser.firstName + ' ' + selectedUser.lastName),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: selectedUser.avatar,
              child: Container(
                height: 300.0,
                color: Theme.of(context).accentColor,
                child: InteractiveViewer(
                  transformationController: _transformationController,
                  onInteractionEnd: (details) {
                    _transformationController.value = Matrix4.identity();
                  },
                  child: Image.network(
                    selectedUser.avatar,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    indent: 70,
                    endIndent: 70,
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
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.navigate_before),
                        onPressed: () {
                          var previousUser = selectedUser.id - 1;

                          if (previousUser <= 0) {
                            previousUser = selectedUser.id;
                          } else {
                            Navigator.of(context).pushReplacementNamed(
                              UserDetailScreen.routeName,
                              arguments: previousUser,
                            );
                          }
                        },
                      ),
                      Text(selectedUser.id.toString()),
                      IconButton(
                        icon: Icon(Icons.navigate_next),
                        onPressed: () {
                          var nextUser = selectedUser.id + 1;
                          if (nextUser > usersList.length) {
                            nextUser = selectedUser.id;
                          } else {
                            Navigator.of(context).pushReplacementNamed(
                              UserDetailScreen.routeName,
                              arguments: nextUser,
                            );
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
