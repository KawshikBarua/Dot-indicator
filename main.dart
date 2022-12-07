import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:practice/Dot.dart';
import 'package:responsive_grid/responsive_grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int num = 0;
  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                    carouselController: _carouselController,
                    itemCount: 6,
                    itemBuilder:
                        (BuildContext context, int itemIdx, int pageViewIdx) {
                      return Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 400,
                        decoration: const BoxDecoration(color: Colors.grey),
                        child: Text("$itemIdx"),
                      );
                    },
                    options: CarouselOptions(
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      viewportFraction: 1,
                      height: 400,
                    )),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {
                  setState(() {
                    if (num >= 5) {
                      num = 0;
                      _carouselController.jumpToPage(0);
                    }
                    else {
                      num++;
                      _carouselController.nextPage();
                    }
                  });
                }, child: Text("Next")),
                const SizedBox(
                  height: 20,
                ),
                Dot(
                  steps: 5,
                  stepNum: num,
                  activeColor: Colors.red,
                )
              ],
            )));
  }

}
