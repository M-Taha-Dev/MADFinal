import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class task2 extends StatelessWidget {
  const task2({super.key});

  static const String _title = 'WhatsApp Widget';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  List<ExpansionPanel> expansionPanels = [
    ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Text('Expansion Panel');
      },
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Expanded content goes here'),
      ),
      isExpanded: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('WhatsApp'),
          bottom: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                child: Text('Chats'),
              ),
              Tab(
                child: Text('Status'),
              ),
              Tab(
                child: Text('Calls'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              child: Column(
                  children: [
                ExpansionTile(
                  title: Text('Ali Tariq'),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Hi, there i am Ali, Are u there?'),
                    ),
                  ],
                ),
                    ExpansionTile(
                      title: Text('Taha Hasnain'),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Hi, there i am Ali, Are u there?'),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Balawal'),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Hi, there i am Ali, Are u there?'),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Syed Usher'),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Hi, there i am Ali, Are u there?'),
                        ),
                      ],
                    ),
              ]),
            ),
            Center(
              child: CarouselSlider(
                items: [
                  Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5hCPi3jmDYnzd9g2qAmBaHeilVzINkWszTg&usqp=CAU'),
                  Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9jxdrX6gEfBFpMYzoH9_kuYu3MZc51b8EUA&usqp=CAU'),
                  Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoJ33C4iyqodo2zT-iFJASu8rtKQQhv-WJAw&usqp=CAU'),
                ],
                options: CarouselOptions(
                  height: 400,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
            ),
            Container(
              child: Column(children: [
                ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      expansionPanels[index] = ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Text('Expansion Panel');
                        },
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Expanded content goes here'),
                        ),
                        isExpanded: !isExpanded,
                      );
                    });
                  },
                  children: expansionPanels,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
