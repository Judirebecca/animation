// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:animation/Helpers/NavigationHelper/NavigationHelper.dart';
import 'package:animation/Pages/SecondPage/SecondPageVM.dart';
import 'package:flutter/material.dart';

import '../../Helpers/NavigationHelper/Mixin/NavigationMixin.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  SecondPageVM _secondPageVM = SecondPageVM();

  @override
  void initState(){
    super.initState();
        _secondPageVM.navigationStream.stream.listen((event) {
      if(event is NavigatorPop){
        context.pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second page"),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("lib/Helpers/Assets/Images/image01.jpg"),
            
              ElevatedButton(onPressed: _secondPageVM.navigationtohomepage , child: const Text("Back")),
              const SizedBox(height: 20,),
            ],
          ),
  );
  }
}
