import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Tasks/task13/push_notification.dart';
import 'firebase_options.dart';

import './Tasks/task1.dart';
import './Tasks/task2.dart';
import './Tasks/task3.dart';
import './Tasks/task4.dart';
import './Tasks/task5.dart';
import './Tasks/task6.dart';
import './Tasks/task7.dart';
import './Tasks/task8.dart';
import './Tasks/task9.dart';
import './Tasks/task10.dart';
import './Tasks/task11.dart';
import './Tasks/task12.dart';
import './Tasks/task13.dart';
import './Tasks/task8/list_of_items.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [    task1(),    task2(), task3(),task4(),task5(),task6(),task7(),const ListOfItems(),task9(),task10(), task11(),task12(),task13(), ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAD Final'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Tasks'),
              decoration: BoxDecoration(
                color: Colors.blue,

              ),
            ),
            ListTile(
              title: Text('Task 1'),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Task 2'),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Task 3'),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
                Navigator.pop(context);
              },
            ),ListTile(
              title: Text('Task 4'),
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });
                Navigator.pop(context);
              },
            ),ListTile(
              title: Text('Task 5'),
              onTap: () {
                setState(() {
                  _currentIndex = 4;
                });
                Navigator.pop(context);
              },
            ),ListTile(
              title: Text('Task 6'),
              onTap: () {
                setState(() {
                  _currentIndex = 5;
                });
                Navigator.pop(context);
              },
            ),ListTile(
              title: Text('Task 7'),
              onTap: () {
                setState(() {
                  _currentIndex = 6;
                });
                Navigator.pop(context);
              },
            ),ListTile(
              title: Text('Task 8'),
              onTap: () {
                setState(() {
                  _currentIndex = 7;
                });
                Navigator.pop(context);
              },
            ),ListTile(
              title: Text('Task 9'),
              onTap: () {
                setState(() {
                  _currentIndex = 8;
                });
                Navigator.pop(context);
              },
            ),ListTile(
              title: Text('Task 10'),
              onTap: () {
                setState(() {
                  _currentIndex = 9;
                });
                Navigator.pop(context);
              },
            ),ListTile(
              title: Text('Task 11'),
              onTap: () {
                setState(() {
                  _currentIndex = 10;
                });
                Navigator.pop(context);
              },
            ),ListTile(
              title: Text('Task 12'),
              onTap: () {
                setState(() {
                  _currentIndex = 11;
                });
                Navigator.pop(context);
              },
            ),ListTile(
              title: Text('Task 13'),
              onTap: () {
                setState(() {
                  _currentIndex = 12;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _pages[_currentIndex],
      ),
    );
  }
}
