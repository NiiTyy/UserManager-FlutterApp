import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_flutter_app/src/providers/user_provider.dart';
import 'package:user_flutter_app/src/screens/user_detail_screen.dart';

import './src/screens/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: DashboardScreen(),
        initialRoute: '/',
        routes: {
          UserDetailScreen.routeName: (ctx) => UserDetailScreen(),
        },
      ),
    );
  }
}
