import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/user_item.dart';
import '../providers/user_provider.dart';

class UsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserProvider>(context).usersList;
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: userData[index],
          child: UserItem(),
        );
      },
      itemCount: userData.length,
    );
  }
}
