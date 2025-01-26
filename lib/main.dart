import 'package:crowdfunding_frontend/components/app_bar.dart';
import 'package:crowdfunding_frontend/model/local/user.dart';
import 'package:crowdfunding_frontend/session.dart';
import 'package:crowdfunding_frontend/views/home.dart';
import 'package:flutter/material.dart';

void main() async {
  UserManager().setUser(await UserModelLocal().getUser('1'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: MainAppBar(),
          body: TabBarView(
            children: [
              Home(),
              Icon(Icons.campaign),
              Icon(Icons.history),
              Icon(Icons.person),
            ],
          ),
          bottomNavigationBar: const TabBar(tabs: [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(
              icon: Icon(Icons.campaign),
              text: 'Campaigns',
            ),
            Tab(
              icon: Icon(Icons.history),
              text: 'History',
            ),
            Tab(
              icon: Icon(Icons.person),
              text: 'Profile',
            )
          ]),
        ),
      ),
    );
  }
}
