import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../screens/user_detail_screen.dart';

class UserItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(UserDetailScreen.routeName, arguments: user.id);
      },
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).accentColor,
      child: Container(
        height: 100,
        width: double.infinity,
        child: Card(
          shadowColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(10),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ListTile(
                    leading: Hero(
                      tag: user.avatar,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                        radius: 30,
                        // child: Image.network(user.avatar),
                      ),
                    ),
                    title: Text(user.firstName + ' ' + user.lastName),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
