// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class RandomPage extends StatelessWidget {
  const RandomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeAnimationCurve: Curves.bounceIn,
        home: Scaffold(
            bottomNavigationBar: Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 10, left: 4, right: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: Colors.redAccent,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
              surfaceTintColor: Colors.white,
              actions: [
                IconButton(
                    onPressed: () {
                      print('pressed logout');
                    },
                    icon: const Icon(
                      Icons.logout,
                      size: 30,
                    ))
              ],
              shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              title: const Text(
                'Flutter Test',
                textAlign: TextAlign.center,
              ),
              elevation: 3,
              leading: IconButton(
                onPressed: () {
                  print('pressed menu');
                },
                icon: const Icon(
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
                  child: const Icon(
                    Icons.favorite,
                    size: 50,
                  )),
            )));
  }
}
