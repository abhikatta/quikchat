// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeAnimationCurve: Curves.bounceIn,
        home: Scaffold(
            bottomNavigationBar: Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 10, left: 4, right: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: Colors.redAccent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite, color: Colors.white, size: 30),
                      Text(
                        'HEART',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite, color: Colors.white, size: 30),
                      Text(
                        'HEART',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite, color: Colors.white, size: 30),
                      Text(
                        'HEART',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
            backgroundColor: Colors.amberAccent,
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      print('pressed logout');
                    },
                    icon: Icon(
                      Icons.logout,
                      size: 30,
                    ))
              ],
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              title: Text(
                'Flutter Test',
                textAlign: TextAlign.justify,
              ),
              elevation: 3,
              leading: IconButton(
                onPressed: () {
                  print('pressed menu');
                },
                icon: Icon(
                  Icons.menu,
                  size: 30,
                ),
              ),
              shadowColor: Colors.yellowAccent,
            ),
            body: Center(
              child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.redAccent),
                  child: Icon(
                    Icons.favorite,
                    size: 50,
                  )),
            )));
  }
}
