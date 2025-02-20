import 'package:crowdfunding_frontend/components/app_bar.dart';
import 'package:crowdfunding_frontend/model/db/user.dart';
import 'package:crowdfunding_frontend/session.dart';
import 'package:crowdfunding_frontend/views/campaigns.dart';
import 'package:crowdfunding_frontend/views/home.dart';
import 'package:crowdfunding_frontend/views/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  UserManager().setUser(await UserModelDB().getUser('hola@gmail.com'));
  runApp(Phoenix(child: const MyApp()));
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
              CampaignsView(),
              History(),
              Icon(Icons.person),
            ],
          ),
          bottomNavigationBar: const TabBar(
              labelColor: Color(0xFFC1E965),
              indicatorColor: Color(0xFFC1E965),
              tabs: [
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
