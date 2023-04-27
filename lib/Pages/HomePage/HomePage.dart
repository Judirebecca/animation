import 'package:animation/Helpers/NavigationHelper/NavigationHelper.dart';
import 'package:animation/Pages/HomePage/HomePageVM.dart';
import 'package:flutter/material.dart';

import '../../Helpers/NavigationHelper/Mixin/NavigationMixin.dart';
import '../../Helpers/NavigationHelper/Routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  HomePageVM _homePageVM = HomePageVM();

  late AnimationController _controller;

  late Animation _sizeTween;

  late Animation _colorTween;

  @override
  void initState() {
    super.initState();

      _homePageVM.navigationStream.stream.listen((event) {
      if(event is NavigatorPush){
        context.push(pageConfig: Pages.secondPageConfig, data: null);
      }
    });

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _controller.forward();

    _controller.addListener(() {
      setState(() {
        // print(_controller.value);
      });
    });

    _colorTween =
        ColorTween(begin: Colors.black, end: Colors.amber).animate(_controller);

    _colorTween.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _sizeTween = Tween(begin: 20.0, end: 300.0).animate(_controller);

    _sizeTween.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              label: "Settings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.black),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black), label: "Home"),
        ],
      ),
      appBar: AppBar(
        title: const Text("Animation"),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [Column(
          children: [
            const SizedBox(
              height: 4,
            ),
            Center(
              child: AnimatedDefaultTextStyle(
                curve: Curves.linear,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: _colorTween.value),
                duration: const Duration(seconds: 1),
                child: const Text("Bounce and Transition animation"),
              ),
            ),
            const SizedBox(height: 160),
            AnimatedContainer(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.amber),
              height: _sizeTween.value,
              width: _sizeTween.value,
              duration: const Duration(seconds: 5),
            ),
            const SizedBox(height: 200,),
            
            // AnimatedAlign(alignment: null, duration: duration)
          ],
        ),

            ElevatedButton(onPressed: _homePageVM.navigationtosecondpage, child: const Text("Press here for transition"))
      
      ]),

    );
  }
}
