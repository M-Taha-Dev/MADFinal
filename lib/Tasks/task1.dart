import 'package:flutter/material.dart';

class task1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Button 1'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Button 2'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              color: Colors.red,
            ),
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  color: Colors.green,
                  child: Center(
                    child: Text('Grid Item 1'),
                  ),
                ),
                Container(
                  color: Colors.orange,
                  child: Center(
                    child: Text('Grid Item 2'),
                  ),
                ),
                Container(
                  color: Colors.purple,
                  child: Center(
                    child: Text('Grid Item 3'),
                  ),
                ),
                Container(
                  color: Colors.yellow,
                  child: Center(
                    child: Text('Grid Item 4'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
