import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_flutter_app/src/providers/user_provider.dart';

import '../widgets/users_list.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Manager'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Provider.of<UserProvider>(context, listen: false).fetchUsers(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              return Center(
                child: AlertDialog(
                  title: Text('An error occurred'),
                  content: Text('Something went wrong!'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text('Okay'),
                    ),
                  ],
                ),
              );
            } else {
              return Consumer<UserProvider>(
                builder: (ctx, _, child) => UsersList(),
              );
            }
          }
        },
      ),
    );
  }
}
